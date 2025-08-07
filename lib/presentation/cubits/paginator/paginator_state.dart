import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/failure.dart';
import '../../../domain/entities/movie.dart';
import 'paginator_cubit.dart';

part 'paginator_state.freezed.dart';

@freezed
class PaginatorState with _$PaginatorState {
  const factory PaginatorState({
    required List<Movie> movies,
    required bool isLoading,
    required bool isLoadingMore,
    required bool hasReachedMax,
    required int page,
    Failure? error,
    PaginatorDataType? dataType,
  }) = _PaginatorState;

  factory PaginatorState.initial() => const PaginatorState(
    movies: [],
    isLoading: false,
    isLoadingMore: false,
    hasReachedMax: false,
    page: 0,
  );
}
