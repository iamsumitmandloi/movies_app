import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/utils/failure.dart';
import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

@injectable
class SearchMovies {
  final MovieRepository repository;

  SearchMovies(this.repository);

  Future<Either<Failure, List<Movie>>> call(String query) async {
    if (query.isEmpty) {
      return const Right([]);
    }
    return await repository.searchMovies(query);
  }
}
