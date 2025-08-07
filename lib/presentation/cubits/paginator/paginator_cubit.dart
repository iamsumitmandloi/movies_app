import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'dart:developer' as dev;
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

import '../../../core/utils/failure.dart';
import '../../../domain/entities/movie.dart';
import '../../../domain/repositories/movie_repository.dart';
import 'paginator_state.dart';

enum PaginatorDataType { trending, nowPlaying }

@injectable
class PaginatorCubit extends Cubit<PaginatorState> {
  final MovieRepository _movieRepository;

  PaginatorCubit(this._movieRepository) : super(PaginatorState.initial());

  Future<void> loadPage(PaginatorDataType dataType, int page) async {
    if (kDebugMode) dev.log('PaginatorCubit → loadPage $dataType page=$page');
    if (page == 1) {
      emit(
        state.copyWith(
          isLoading: true,
          error: null,
          movies: [],
          page: 1,
          hasReachedMax: false,
          dataType: dataType,
        ),
      );
    }

    final result = await _fetchData(dataType, page);

    result.fold(
      (failure) {
        if (kDebugMode) dev.log('PaginatorCubit → error ${failure.message}');
        emit(state.copyWith(isLoading: false, error: failure));
      },
      (movies) {
        final updatedMovies = page == 1 ? movies : [...state.movies, ...movies];
        if (kDebugMode)
          dev.log(
            'PaginatorCubit → loaded page=$page movies=${movies.length} hasReachedMax=${movies.isEmpty}',
          );
        emit(
          state.copyWith(
            isLoading: false,
            movies: updatedMovies,
            page: page,
            hasReachedMax: movies.isEmpty,
            dataType: dataType,
          ),
        );
      },
    );
  }

  Future<Either<Failure, List<Movie>>> _fetchData(
    PaginatorDataType dataType,
    int page,
  ) {
    switch (dataType) {
      case PaginatorDataType.trending:
        return _movieRepository.getTrendingMovies();
      case PaginatorDataType.nowPlaying:
        return _movieRepository.getNowPlayingMovies();
    }
  }
}
