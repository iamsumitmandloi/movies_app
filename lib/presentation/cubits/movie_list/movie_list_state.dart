import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/failure.dart';
import '../../../domain/entities/movie.dart';

part 'movie_list_state.freezed.dart';

@freezed
class MovieListState with _$MovieListState {
  const factory MovieListState.initial() = _Initial;
  const factory MovieListState.loading() = _Loading;
  const factory MovieListState.loaded({
    required List<Movie> trendingMovies,
    required List<Movie> nowPlayingMovies,
    Failure? trendingMoviesFailure,
    Failure? nowPlayingMoviesFailure,
  }) = _Loaded;
  const factory MovieListState.error(String message) = _Error;
}
