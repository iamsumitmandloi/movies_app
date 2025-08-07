import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/movie.dart';
import '../../../domain/usecases/get_bookmarked_movies.dart';
import '../../../domain/usecases/toggle_bookmark.dart';
import 'bookmark_state.dart';

@injectable
class BookmarkCubit extends Cubit<BookmarkState> {
  final GetBookmarkedMovies _getBookmarkedMovies;
  final ToggleBookmark _toggleBookmark;

  BookmarkCubit(this._getBookmarkedMovies, this._toggleBookmark)
    : super(BookmarkInitial());

  Future<void> loadBookmarks() async {
    emit(BookmarkLoading());

    final result = await _getBookmarkedMovies();
    result.fold(
      (failure) => emit(BookmarkError(failure.message)),
      (movies) => emit(BookmarkLoaded(movies)),
    );
  }

  Future<void> toggleBookmark(Movie movie) async {
    final result = await _toggleBookmark(movie);
    result.fold(
      (failure) => emit(BookmarkError(failure.message)),
      (_) => loadBookmarks(),
    );
  }
}
