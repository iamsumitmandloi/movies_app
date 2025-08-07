import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/presentation/cubits/paginator/paginator_cubit.dart';
import 'package:movies_app/presentation/pages/movie_listings/movie_listings_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../presentation/pages/home/home_page.dart';
import '../../presentation/pages/search/search_page.dart';
import '../../presentation/pages/bookmarks/bookmarks_page.dart';
import '../../presentation/pages/movie_detail/movie_detail_page.dart';
import '../../presentation/pages/main_navigation/main_navigation_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      path: '/',
      page: MainNavigationRoute.page,
      initial: true,
      children: [
        AutoRoute(path: 'home', page: HomeRoute.page, initial: true),
        AutoRoute(path: 'search', page: SearchRoute.page),
        AutoRoute(path: 'bookmarks', page: BookmarksRoute.page),
      ],
    ),
    AutoRoute(path: '/movie/:id', page: MovieDetailRoute.page),
    AutoRoute(path: '/listings', page: MovieListingsRoute.page),
    AutoRoute(path: '/shared/movie/:id', page: MovieDetailRoute.page),
  ];
}
