import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/utils/failure.dart';
import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

@injectable
class GetMovieDetail {
  final MovieRepository repository;

  GetMovieDetail(this.repository);

  Future<Either<Failure, Movie>> call(int id) async {
    return await repository.getMovieDetail(id);
  }
}
