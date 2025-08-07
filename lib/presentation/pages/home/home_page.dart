import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/configs/styles/app_colors.dart';
import 'package:movies_app/core/utils/responsive_utils.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/presentation/cubits/movie_list/movie_list_cubit.dart';
import 'package:movies_app/presentation/cubits/movie_list/movie_list_state.dart';
import 'package:movies_app/presentation/cubits/paginator/paginator_cubit.dart';
import 'package:movies_app/presentation/cubits/theme/theme_cubit.dart';
import 'package:movies_app/presentation/widgets/movie_carousel.dart';
import 'package:movies_app/presentation/widgets/shimmer_placeholder.dart';
import 'package:movies_app/core/router/app_router.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/utils/failure.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
        actions: [
          IconButton(
            onPressed: () => context.read<ThemeCubit>().toggleTheme(),
            icon: Icon(
              context.watch<ThemeCubit>().state == ThemeMode.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
          ),
        ],
      ),
      body: BlocBuilder<MovieListCubit, MovieListState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  _buildShimmerSection('Trending Movies 🔥'),
                  const SizedBox(height: 24),
                  _buildShimmerSection('Now Playing'),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            error: (message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(message),
                  ElevatedButton(
                    onPressed: () =>
                        context.read<MovieListCubit>().loadMovies(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
            loaded:
                (
                  trendingMovies,
                  nowPlayingMovies,
                  trendingMoviesFailure,
                  nowPlayingMoviesFailure,
                ) {
                  return RefreshIndicator(
                    onRefresh: () =>
                        context.read<MovieListCubit>().loadMovies(),
                    child: CustomScrollView(
                      slivers: [
                        _buildSection(
                          context,
                          title: 'Trending Movies 🔥',
                          movies: trendingMovies,
                          failure: optionOf(trendingMoviesFailure),
                          dataType: PaginatorDataType.trending,
                        ),
                        _buildSection(
                          context,
                          title: 'Now Playing',
                          movies: nowPlayingMovies,
                          failure: optionOf(nowPlayingMoviesFailure),
                          dataType: PaginatorDataType.nowPlaying,
                        ),
                      ],
                    ),
                  );
                },
          );
        },
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required List<Movie> movies,
    required Option<Failure> failure,
    required PaginatorDataType dataType,
  }) {
    return SliverToBoxAdapter(
      child: failure.fold(
        () => movies.isEmpty
            ? const SizedBox.shrink()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () => context.router.push(
                            MovieListingsRoute(
                              title: title,
                              dataType: dataType,
                            ),
                          ),
                          child: const Text('See All'),
                        ),
                      ],
                    ),
                  ),
                  MovieCarousel(
                    movies: movies,
                    title: title,
                    height: ResponsiveUtils.getCarouselHeight(context),
                    onMovieTap: (movie) {
                      context.router.push(MovieDetailRoute(movie: movie));
                    },
                  ),
                  const SizedBox(height: 24),
                ],
              ),
        (f) => Container(
          height: ResponsiveUtils.getCarouselHeight(context),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Could not load $title',
                style: const TextStyle(color: AppColors.error),
              ),
              const SizedBox(height: 8),
              Text(
                f.message,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => context.read<MovieListCubit>().loadMovies(),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShimmerSection(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ShimmerPlaceholder.rectangular(height: 24, width: 150),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: ShimmerPlaceholder.rectangular(height: 200, width: 130),
              );
            },
          ),
        ),
      ],
    );
  }
}
