import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../core/constants/api_constants.dart';
import 'dto/movie_response_dto.dart';
import 'dto/movie_dto.dart';

part 'movie_api_client.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
@injectable
abstract class MovieApiClient {
  @factoryMethod
  factory MovieApiClient(Dio dio) = _MovieApiClient;

  @GET(ApiConstants.trendingMovies)
  Future<MovieResponseDto> getTrendingMovies({@Query('page') int page = 1});

  @GET(ApiConstants.nowPlayingMovies)
  Future<MovieResponseDto> getNowPlayingMovies({@Query('page') int page = 1});

  @GET(ApiConstants.searchMovies)
  Future<MovieResponseDto> searchMovies({
    @Query('query') required String query,
    @Query('page') int page = 1,
  });

  @GET('${ApiConstants.movieDetails}/{id}')
  Future<MovieDto> getMovieDetail({@Path('id') required int id});
}
