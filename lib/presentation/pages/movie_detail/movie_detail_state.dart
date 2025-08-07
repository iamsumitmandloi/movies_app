import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/movie.dart';

part 'movie_detail_state.freezed.dart';

@freezed
class MovieDetailState with _$MovieDetailState {
  const factory MovieDetailState.loading() = _Loading;
  const factory MovieDetailState.loaded(Movie movie) = _Loaded;
  const factory MovieDetailState.error(String message) = _Error;
}
