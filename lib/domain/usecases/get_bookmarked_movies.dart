import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/utils/failure.dart';
import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

@injectable
class GetBookmarkedMovies {
  final MovieRepository repository;

  GetBookmarkedMovies(this.repository);

  Future<Either<Failure, List<Movie>>> call() async {
    return await repository.getBookmarkedMovies();
  }
}
