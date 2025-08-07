import 'package:drift/drift.dart';

import '../app_database.dart';
import '../entities/movie_entity.dart';

part 'movie_dao.g.dart';

@DriftAccessor(tables: [Movies])
class MovieDao extends DatabaseAccessor<AppDatabase> with _$MovieDaoMixin {
  MovieDao(super.db);

  Future<List<MovieEntity>> getAllMovies() => select(movies).get();

  Future<MovieEntity?> getMovieById(int id) =>
      (select(movies)..where((m) => m.id.equals(id))).getSingleOrNull();

  Future<List<MovieEntity>> searchMovies(String query) =>
      (select(movies)..where(
            (m) => m.title.like('%$query%') | m.overview.like('%$query%'),
          ))
          .get();

  Future<List<MovieEntity>> getBookmarkedMovies() =>
      (select(movies)..where((m) => m.isBookmarked)).get();

  Stream<List<MovieEntity>> watchBookmarkedMovies() =>
      (select(movies)..where((m) => m.isBookmarked)).watch();

  Future<int> insertOrUpdateMovie(MoviesCompanion movie) =>
      into(movies).insertOnConflictUpdate(movie);

  Future<void> insertMovies(List<MoviesCompanion> movieList) => batch((batch) {
    batch.insertAllOnConflictUpdate(movies, movieList);
  });

  Future<bool> updateBookmarkStatus(int movieId, bool isBookmarked) async {
    final rowsAffected =
        await (update(movies)..where((m) => m.id.equals(movieId))).write(
          MoviesCompanion(isBookmarked: Value(isBookmarked)),
        );
    return rowsAffected > 0;
  }

  Future<bool> isMovieBookmarked(int movieId) async {
    final movie = await (select(
      movies,
    )..where((m) => m.id.equals(movieId))).getSingleOrNull();
    return movie?.isBookmarked ?? false;
  }

  Future<int> deleteMovie(int id) =>
      (delete(movies)..where((m) => m.id.equals(id))).go();

  Future<int> clearAllMovies() => delete(movies).go();
}
