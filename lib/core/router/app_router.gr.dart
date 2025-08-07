// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint, unused_element_parameter
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    BookmarksRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BookmarksPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    MainNavigationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainNavigationPage(),
      );
    },
    MovieDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<MovieDetailRouteArgs>(
        orElse: () => MovieDetailRouteArgs(movieId: pathParams.optInt('id')),
      );
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MovieDetailPage(
          key: args.key,
          movie: args.movie,
          movieId: args.movieId,
        ),
      );
    },
    MovieListingsRoute.name: (routeData) {
      final args = routeData.argsAs<MovieListingsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MovieListingsPage(
          key: args.key,
          title: args.title,
          dataType: args.dataType,
        ),
      );
    },
    SearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchPage(),
      );
    },
  };
}

/// generated route for
/// [BookmarksPage]
class BookmarksRoute extends PageRouteInfo<void> {
  const BookmarksRoute({List<PageRouteInfo>? children})
    : super(BookmarksRoute.name, initialChildren: children);

  static const String name = 'BookmarksRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainNavigationPage]
class MainNavigationRoute extends PageRouteInfo<void> {
  const MainNavigationRoute({List<PageRouteInfo>? children})
    : super(MainNavigationRoute.name, initialChildren: children);

  static const String name = 'MainNavigationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MovieDetailPage]
class MovieDetailRoute extends PageRouteInfo<MovieDetailRouteArgs> {
  MovieDetailRoute({
    Key? key,
    Movie? movie,
    int? movieId,
    List<PageRouteInfo>? children,
  }) : super(
         MovieDetailRoute.name,
         args: MovieDetailRouteArgs(key: key, movie: movie, movieId: movieId),
         rawPathParams: {'id': movieId},
         initialChildren: children,
       );

  static const String name = 'MovieDetailRoute';

  static const PageInfo<MovieDetailRouteArgs> page =
      PageInfo<MovieDetailRouteArgs>(name);
}

class MovieDetailRouteArgs {
  const MovieDetailRouteArgs({this.key, this.movie, this.movieId});

  final Key? key;

  final Movie? movie;

  final int? movieId;

  @override
  String toString() {
    return 'MovieDetailRouteArgs{key: $key, movie: $movie, movieId: $movieId}';
  }
}

/// generated route for
/// [MovieListingsPage]
class MovieListingsRoute extends PageRouteInfo<MovieListingsRouteArgs> {
  MovieListingsRoute({
    Key? key,
    required String title,
    required PaginatorDataType dataType,
    List<PageRouteInfo>? children,
  }) : super(
         MovieListingsRoute.name,
         args: MovieListingsRouteArgs(
           key: key,
           title: title,
           dataType: dataType,
         ),
         initialChildren: children,
       );

  static const String name = 'MovieListingsRoute';

  static const PageInfo<MovieListingsRouteArgs> page =
      PageInfo<MovieListingsRouteArgs>(name);
}

class MovieListingsRouteArgs {
  const MovieListingsRouteArgs({
    this.key,
    required this.title,
    required this.dataType,
  });

  final Key? key;

  final String title;

  final PaginatorDataType dataType;

  @override
  String toString() {
    return 'MovieListingsRouteArgs{key: $key, title: $title, dataType: $dataType}';
  }
}

/// generated route for
/// [SearchPage]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute({List<PageRouteInfo>? children})
    : super(SearchRoute.name, initialChildren: children);

  static const String name = 'SearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
