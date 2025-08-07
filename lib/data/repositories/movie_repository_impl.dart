import 'package:dartz/dartz.dart';
import 'dart:developer' as dev;
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../core/constants/api_constants.dart';

import '../../core/utils/failure.dart';
import '../../domain/entities/movie.dart';
import '../../domain/repositories/movie_repository.dart';
import '../database/app_database.dart';
import '../mappers/movie_mapper.dart';
import '../network/dto/movie_response_dto.dart';
import '../network/movie_api_client.dart';

Future<List<Movie>> _parseAndMapMovies(MovieResponseDto response) async {
  return response.results.map(MovieMapper.fromDto).toList();
}

@LazySingleton(as: MovieRepository)
class MovieRepositoryImpl implements MovieRepository {
  final MovieApiClient _apiClient;
  final AppDatabase _database;

  MovieRepositoryImpl(this._apiClient, this._database);

  @override
  Future<Either<Failure, List<Movie>>> getTrendingMovies() async {
    try {
      final cacheKey = 'trending_movies';
      final isCacheValid = await _database.cacheMetadataDao.isCacheValid(
        cacheKey,
      );

      if (isCacheValid) {
        final cachedMovies = await _database.movieDao.getAllMovies();
        if (cachedMovies.isNotEmpty) {
          return Right(cachedMovies.map(MovieMapper.fromDatabase).toList());
        }
      }

      final response = await _apiClient.getTrendingMovies();
      final movies = await compute(_parseAndMapMovies, response);

      await _cacheMovies(movies, cacheKey);

      return Right(movies);
    } on Exception catch (e) {
      try {
        final cachedMovies = await _database.movieDao.getAllMovies();
        if (cachedMovies.isNotEmpty) {
          return Right(cachedMovies.map(MovieMapper.fromDatabase).toList());
        }
      } catch (_) {}

      return Left(_handleException(e));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    try {
      final cacheKey = 'now_playing_movies';
      final isCacheValid = await _database.cacheMetadataDao.isCacheValid(
        cacheKey,
      );

      if (isCacheValid) {
        final cachedMovies = await _database.movieDao.getAllMovies();
        if (cachedMovies.isNotEmpty) {
          return Right(cachedMovies.map(MovieMapper.fromDatabase).toList());
        }
      }

      final response = await _apiClient.getNowPlayingMovies();
      final movies = await compute(_parseAndMapMovies, response);

      await _cacheMovies(movies, cacheKey);

      return Right(movies);
    } on Exception catch (e) {
      try {
        final cachedMovies = await _database.movieDao.getAllMovies();
        if (cachedMovies.isNotEmpty) {
          return Right(cachedMovies.map(MovieMapper.fromDatabase).toList());
        }
      } catch (_) {}

      return Left(_handleException(e));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> searchMovies(String query) async {
    try {
      final cachedResults = await _database.movieDao.searchMovies(query);

      try {
        final response = await _apiClient.searchMovies(query: query);
        final apiMovies = response.results.map(MovieMapper.fromDto).toList();

        final allMovies = <Movie>[];
        final seenIds = <int>{};

        for (final movie in apiMovies) {
          if (!seenIds.contains(movie.id)) {
            allMovies.add(movie);
            seenIds.add(movie.id);
          }
        }

        for (final entity in cachedResults) {
          final movie = MovieMapper.fromDatabase(entity);
          if (!seenIds.contains(movie.id)) {
            allMovies.add(movie);
            seenIds.add(movie.id);
          }
        }

        return Right(allMovies);
      } catch (_) {
        return Right(cachedResults.map(MovieMapper.fromDatabase).toList());
      }
    } on Exception catch (e) {
      return Left(_handleException(e));
    }
  }

  @override
  Future<Either<Failure, Movie>> getMovieDetail(int id) async {
    try {
      final cachedMovie = await _database.movieDao.getMovieById(id);

      try {
        final movieDto = await _apiClient.getMovieDetail(id: id);
        final movie = MovieMapper.fromDto(movieDto);

        await _database.movieDao.insertOrUpdateMovie(
          MovieMapper.toDatabase(movie),
        );

        return Right(movie);
      } catch (_) {
        if (cachedMovie != null) {
          return Right(MovieMapper.fromDatabase(cachedMovie));
        }
        rethrow;
      }
    } on Exception catch (e) {
      return Left(_handleException(e));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getBookmarkedMovies() async {
    try {
      final bookmarkedEntities = await _database.movieDao.getBookmarkedMovies();
      final movies = bookmarkedEntities.map(MovieMapper.fromDatabase).toList();
      return Right(movies);
    } on Exception catch (e) {
      return Left(_handleException(e));
    }
  }

  @override
  Future<Either<Failure, void>> toggleBookmark(Movie movie) async {
    try {
      final isCurrentlyBookmarked = await _database.movieDao.isMovieBookmarked(
        movie.id,
      );
      final newBookmarkStatus = !isCurrentlyBookmarked;

      final updatedMovie = movie.copyWith(isBookmarked: newBookmarkStatus);
      await _database.movieDao.insertOrUpdateMovie(
        MovieMapper.toDatabase(updatedMovie),
      );

      return const Right(null);
    } on Exception catch (e) {
      return Left(_handleException(e));
    }
  }

  @override
  Future<Either<Failure, bool>> isBookmarked(int movieId) async {
    try {
      final isBookmarked = await _database.movieDao.isMovieBookmarked(movieId);
      return Right(isBookmarked);
    } on Exception catch (e) {
      return Left(_handleException(e));
    }
  }

  Future<void> _cacheMovies(List<Movie> movies, String cacheKey) async {
    final existingMovies = await _database.movieDao.getAllMovies();
    final bookmarkedIds = existingMovies
        .where((m) => m.isBookmarked)
        .map((m) => m.id)
        .toSet();

    final moviesToCache = movies.map((movie) {
      return movie.copyWith(isBookmarked: bookmarkedIds.contains(movie.id));
    }).toList();

    await _database.transaction(() async {
      final movieEntities = moviesToCache.map(MovieMapper.toDatabase).toList();
      await _database.movieDao.insertMovies(movieEntities);

      final expiresAt = DateTime.now().add(
        const Duration(hours: AppConstants.maxCacheAgeHours),
      );

      await _database.cacheMetadataDao.insertOrUpdateCacheMetadata(
        CacheMetadataCompanion.insert(
          key: cacheKey,
          lastUpdated: DateTime.now(),
          expiresAt: expiresAt,
        ),
      );
    });
    if (kDebugMode)
      dev.log('Repo → cached ${movies.length} movies for $cacheKey');
  }

  Failure _handleException(Exception e) {
    if (e.toString().contains('SocketException') ||
        e.toString().contains('HandshakeException')) {
      return const NetworkFailure('No internet connection');
    } else if (e.toString().contains('TimeoutException')) {
      return const NetworkFailure('Connection timeout');
    } else if (e.toString().contains('401')) {
      return const ServerFailure('Invalid API key');
    } else if (e.toString().contains('404')) {
      return const ServerFailure('Resource not found');
    } else if (e.toString().contains('500')) {
      return const ServerFailure('Server error');
    } else {
      return UnknownFailure('Unexpected error: ${e.toString()}');
    }
  }
}
