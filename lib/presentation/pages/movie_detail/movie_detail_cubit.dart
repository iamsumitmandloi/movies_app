import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/movie.dart';
import '../../../domain/usecases/get_movie_detail.dart';
import 'movie_detail_state.dart';

@injectable
class MovieDetailCubit extends Cubit<MovieDetailState> {
  final GetMovieDetail _getMovieDetail;

  MovieDetailCubit(this._getMovieDetail) : super(const MovieDetailState.loading());

  Future<void> loadMovie({Movie? movie, int? movieId}) async {
    if (movie != null) {
      emit(MovieDetailState.loaded(movie));
      return;
    }

    if (movieId != null) {
      final result = await _getMovieDetail(movieId);
      result.fold(
        (failure) => emit(MovieDetailState.error(failure.message)),
        (movie) => emit(MovieDetailState.loaded(movie)),
      );
    } else {
      emit(const MovieDetailState.error('No movie or movie ID provided.'));
    }
  }
}
