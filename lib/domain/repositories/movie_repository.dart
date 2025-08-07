import 'package:dartz/dartz.dart';

import '../../core/utils/failure.dart';
import '../entities/movie.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getTrendingMovies();
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> searchMovies(String query);
  Future<Either<Failure, Movie>> getMovieDetail(int id);
  Future<Either<Failure, List<Movie>>> getBookmarkedMovies();
  Future<Either<Failure, void>> toggleBookmark(Movie movie);
  Future<Either<Failure, bool>> isBookmarked(int movieId);
}
