import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/utils/failure.dart';
import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

@injectable
class ToggleBookmark {
  final MovieRepository repository;

  ToggleBookmark(this.repository);

  Future<Either<Failure, void>> call(Movie movie) async {
    return await repository.toggleBookmark(movie);
  }
}
