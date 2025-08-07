import 'package:equatable/equatable.dart';

import '../../../domain/entities/movie.dart';

abstract class BookmarkState extends Equatable {
  const BookmarkState();

  @override
  List<Object> get props => [];

  bool isBookmarked(int movieId) => false;
}

class BookmarkInitial extends BookmarkState {}

class BookmarkLoading extends BookmarkState {}

class BookmarkLoaded extends BookmarkState {
  final List<Movie> bookmarks;

  const BookmarkLoaded(this.bookmarks);

  @override
  List<Object> get props => [bookmarks];

  @override
  bool isBookmarked(int movieId) {
    return bookmarks.any((movie) => movie.id == movieId);
  }
}

class BookmarkError extends BookmarkState {
  final String message;

  const BookmarkError(this.message);

  @override
  List<Object> get props => [message];
}
