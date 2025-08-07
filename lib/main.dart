import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/injection_container.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'presentation/cubits/bookmark/bookmark_cubit.dart';
import 'presentation/cubits/theme/theme_cubit.dart';
import 'presentation/cubits/movie_list/movie_list_cubit.dart';
import 'presentation/cubits/paginator/paginator_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  PaintingBinding.instance.imageCache.maximumSizeBytes =
      100 * 1024 * 1024;

  await configureDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<ThemeCubit>()),
        BlocProvider(
          create: (context) => getIt<MovieListCubit>()..loadMovies(),
        ),
        BlocProvider(
          create: (context) => getIt<BookmarkCubit>()..loadBookmarks(),
        ),
        BlocProvider(create: (context) => getIt<PaginatorCubit>()),
      ],
      child: MoviesApp(),
    ),
  );
}

class MoviesApp extends StatelessWidget {
  MoviesApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return MaterialApp.router(
          title: 'Movies App',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeMode,
          routerConfig: _appRouter.config(),
        );
      },
    );
  }
}
