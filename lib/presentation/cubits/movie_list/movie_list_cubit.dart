import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import '../../../core/constants/api_constants.dart';
import 'dart:developer' as dev;
import 'package:injectable/injectable.dart';

import '../../../domain/usecases/get_trending_movies.dart';
import '../../../domain/usecases/get_now_playing_movies.dart';
import 'movie_list_state.dart';

@injectable
class MovieListCubit extends Cubit<MovieListState> {
  final GetTrendingMovies _getTrendingMovies;
  final GetNowPlayingMovies _getNowPlayingMovies;
  Timer? _refreshTimer;

  MovieListCubit(this._getTrendingMovies, this._getNowPlayingMovies)
    : super(const MovieListState.initial()) {
    _setupAutoRefresh();
  }

  void _setupAutoRefresh() {
    _refreshTimer = Timer.periodic(
      const Duration(minutes: AppConstants.cacheRefreshIntervalMinutes),
      (_) => loadMovies(silent: true),
    );
  }

  Future<void> loadMovies({bool silent = false}) async {
    if (!silent) {
      if (kDebugMode) dev.log('MovieListCubit → loading');
      emit(const MovieListState.loading());
    }

    final results = await Future.wait([
      _getTrendingMovies(),
      _getNowPlayingMovies(),
    ]);

    var trendingResult = results[0];
    var nowPlayingResult = results[1];

    if (trendingResult.isLeft() && nowPlayingResult.isRight()) {
      if (kDebugMode)
        dev.log('MovieListCubit → retry trending after partial failure');
      trendingResult = await _getTrendingMovies();
    } else if (nowPlayingResult.isLeft() && trendingResult.isRight()) {
      if (kDebugMode)
        dev.log('MovieListCubit → retry nowPlaying after partial failure');
      nowPlayingResult = await _getNowPlayingMovies();
    }

    if (kDebugMode)
      dev.log(
        'MovieListCubit → loaded (trending: \\${trendingResult.isRight()}, nowPlaying: \\${nowPlayingResult.isRight()})',
      );

    emit(
      MovieListState.loaded(
        trendingMovies: trendingResult.fold((_) => [], (movies) => movies),
        nowPlayingMovies: nowPlayingResult.fold((_) => [], (movies) => movies),
        trendingMoviesFailure: trendingResult.fold(
          (failure) => failure,
          (_) => null,
        ),
        nowPlayingMoviesFailure: nowPlayingResult.fold(
          (failure) => failure,
          (_) => null,
        ),
      ),
    );
  }

  @override
  Future<void> close() {
    _refreshTimer?.cancel();
    return super.close();
  }
}
