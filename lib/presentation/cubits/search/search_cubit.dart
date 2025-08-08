import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/constants/api_constants.dart';
import '../../../domain/usecases/search_movies.dart';
import 'search_state.dart';

@singleton
class SearchCubit extends Cubit<SearchState> {
  final SearchMovies _searchMovies;
  Timer? _debounceTimer;

  SearchCubit(this._searchMovies) : super(SearchInitial());

  void searchMovies(String query) {
    _debounceTimer?.cancel();

    if (query.isEmpty) {
      emit(SearchInitial());
      return;
    }

    emit(SearchLoading());

    _debounceTimer = Timer(
      const Duration(milliseconds: AppConstants.searchDebounceMs),
      () async {
        final result = await _searchMovies(query.trim());
        result.fold(
          (failure) => emit(SearchError(failure.message)),
          (movies) => emit(SearchLoaded(movies: movies, query: query)),
        );
      },
    );
  }

  void clearSearch() {
    _debounceTimer?.cancel();
    emit(SearchInitial());
  }

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    return super.close();
  }
}
