// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:movies_app/core/di/network_module.dart' as _i861;
import 'package:movies_app/data/database/app_database.dart' as _i704;
import 'package:movies_app/data/network/interceptors/api_interceptor.dart'
    as _i374;
import 'package:movies_app/data/network/movie_api_client.dart' as _i664;
import 'package:movies_app/data/repositories/movie_repository_impl.dart'
    as _i33;
import 'package:movies_app/domain/repositories/movie_repository.dart' as _i298;
import 'package:movies_app/domain/usecases/get_bookmarked_movies.dart' as _i926;
import 'package:movies_app/domain/usecases/get_movie_detail.dart' as _i853;
import 'package:movies_app/domain/usecases/get_now_playing_movies.dart'
    as _i686;
import 'package:movies_app/domain/usecases/get_trending_movies.dart' as _i977;
import 'package:movies_app/domain/usecases/search_movies.dart' as _i230;
import 'package:movies_app/domain/usecases/toggle_bookmark.dart' as _i858;
import 'package:movies_app/presentation/cubits/bookmark/bookmark_cubit.dart'
    as _i164;
import 'package:movies_app/presentation/cubits/movie_list/movie_list_cubit.dart'
    as _i778;
import 'package:movies_app/presentation/cubits/paginator/paginator_cubit.dart'
    as _i546;
import 'package:movies_app/presentation/cubits/search/search_cubit.dart'
    as _i574;
import 'package:movies_app/presentation/cubits/theme/theme_cubit.dart' as _i844;
import 'package:movies_app/presentation/pages/movie_detail/movie_detail_cubit.dart'
    as _i241;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.factory<_i374.ApiInterceptor>(() => _i374.ApiInterceptor());
    gh.factory<_i844.ThemeCubit>(() => _i844.ThemeCubit());
    gh.singleton<_i704.AppDatabase>(() => _i704.AppDatabase());
    gh.singleton<_i361.Dio>(
        () => networkModule.provideDio(gh<_i374.ApiInterceptor>()));
    gh.factory<_i664.MovieApiClient>(
        () => _i664.MovieApiClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i298.MovieRepository>(() => _i33.MovieRepositoryImpl(
          gh<_i664.MovieApiClient>(),
          gh<_i704.AppDatabase>(),
        ));
    gh.factory<_i977.GetTrendingMovies>(
        () => _i977.GetTrendingMovies(gh<_i298.MovieRepository>()));
    gh.factory<_i926.GetBookmarkedMovies>(
        () => _i926.GetBookmarkedMovies(gh<_i298.MovieRepository>()));
    gh.factory<_i686.GetNowPlayingMovies>(
        () => _i686.GetNowPlayingMovies(gh<_i298.MovieRepository>()));
    gh.factory<_i853.GetMovieDetail>(
        () => _i853.GetMovieDetail(gh<_i298.MovieRepository>()));
    gh.factory<_i858.ToggleBookmark>(
        () => _i858.ToggleBookmark(gh<_i298.MovieRepository>()));
    gh.factory<_i230.SearchMovies>(
        () => _i230.SearchMovies(gh<_i298.MovieRepository>()));
    gh.factory<_i574.SearchCubit>(
        () => _i574.SearchCubit(gh<_i230.SearchMovies>()));
    gh.factory<_i546.PaginatorCubit>(
        () => _i546.PaginatorCubit(gh<_i298.MovieRepository>()));
    gh.factory<_i241.MovieDetailCubit>(
        () => _i241.MovieDetailCubit(gh<_i853.GetMovieDetail>()));
    gh.factory<_i164.BookmarkCubit>(() => _i164.BookmarkCubit(
          gh<_i926.GetBookmarkedMovies>(),
          gh<_i858.ToggleBookmark>(),
        ));
    gh.factory<_i778.MovieListCubit>(() => _i778.MovieListCubit(
          gh<_i977.GetTrendingMovies>(),
          gh<_i686.GetNowPlayingMovies>(),
        ));
    return this;
  }
}

class _$NetworkModule extends _i861.NetworkModule {}
