import 'dart:convert';

import 'package:drift/drift.dart';

import '../../domain/entities/movie.dart';
import '../database/app_database.dart';
import '../network/dto/movie_dto.dart';

class MovieMapper {
  static MoviesCompanion toDatabase(Movie movie) {
    return MoviesCompanion.insert(
      id: Value(movie.id),
      title: movie.title,
      overview: movie.overview,
      posterPath: Value(movie.posterPath),
      backdropPath: Value(movie.backdropPath),
      voteAverage: movie.voteAverage,
      voteCount: movie.voteCount,
      releaseDate: movie.releaseDate,
      genreIds: jsonEncode(movie.genreIds),
      originalLanguage: movie.originalLanguage,
      originalTitle: movie.originalTitle,
      adult: movie.adult,
      popularity: movie.popularity,
      isBookmarked: Value(movie.isBookmarked),
    );
  }

  static Movie fromDatabase(MovieEntity entity) {
    final genreIds = jsonDecode(entity.genreIds) as List<dynamic>;

    return Movie(
      id: entity.id,
      title: entity.title,
      overview: entity.overview,
      posterPath: entity.posterPath,
      backdropPath: entity.backdropPath,
      voteAverage: entity.voteAverage,
      voteCount: entity.voteCount,
      releaseDate: entity.releaseDate,
      genreIds: genreIds.cast<int>(),
      originalLanguage: entity.originalLanguage,
      originalTitle: entity.originalTitle,
      adult: entity.adult,
      popularity: entity.popularity,
      isBookmarked: entity.isBookmarked,
    );
  }

  static Movie fromDto(MovieDto dto) {
    return dto.toDomainEntity();
  }

  static MovieDto toDto(Movie movie) {
    return MovieDto(
      id: movie.id,
      title: movie.title,
      overview: movie.overview,
      posterPath: movie.posterPath,
      backdropPath: movie.backdropPath,
      voteAverage: movie.voteAverage,
      voteCount: movie.voteCount,
      releaseDate: movie.releaseDate.toIso8601String().split('T')[0],
      genreIds: movie.genreIds,
      originalLanguage: movie.originalLanguage,
      originalTitle: movie.originalTitle,
      adult: movie.adult,
      popularity: movie.popularity,
    );
  }
}
