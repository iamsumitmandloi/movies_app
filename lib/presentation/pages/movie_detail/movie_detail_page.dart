import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:share_plus/share_plus.dart';

import '../../../core/di/injection_container.dart';
import '../../../domain/entities/movie.dart';
import '../../cubits/bookmark/bookmark_cubit.dart';
import '../../cubits/bookmark/bookmark_state.dart';
import 'movie_detail_cubit.dart';
import 'movie_detail_state.dart';
import '../../widgets/expandable_text.dart';
import '../../widgets/rating_chip.dart';
import '../../widgets/shimmer_placeholder.dart';

@RoutePage()
class MovieDetailPage extends StatelessWidget {
  final Movie? movie;
  final int? movieId;

  const MovieDetailPage({super.key, this.movie, @PathParam('id') this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<MovieDetailCubit>()..loadMovie(movie: movie, movieId: movieId),
      child: Scaffold(
        body: BlocBuilder<MovieDetailCubit, MovieDetailState>(
          builder: (context, state) {
            return state.when(
              loading: () => const MovieDetailShimmer(),
              error: (message) => Scaffold(
                appBar: AppBar(),
                body: Center(child: Text(message)),
              ),
              loaded: (movie) => _buildMovieDetail(context, movie),
            );
          },
        ),
      ),
    );
  }

  Widget _buildMovieDetail(BuildContext context, Movie movie) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 300,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              fit: StackFit.expand,
              children: [
                movie.backdropUrl.isNotEmpty
                    ? CachedNetworkImage(
                        imageUrl: movie.backdropUrl,
                        fit: BoxFit.cover,
                        placeholder: (_, __) => const ShimmerPlaceholder(),
                        errorWidget: (_, __, ___) => Container(
                          color: Theme.of(context).cardColor,
                          child: const Center(
                            child: Icon(
                              Icons.movie,
                              size: 64,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      )
                    : Container(
                        color: Theme.of(context).cardColor,
                        child: const Center(
                          child: Icon(
                            Icons.movie,
                            size: 64,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black87],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.title,
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                movie.releaseYear,
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(color: Colors.grey),
                              ),
                              if (movie.originalLanguage.toUpperCase() !=
                                  'EN') ...[
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    movie.originalLanguage.toUpperCase(),
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    RatingChip(rating: movie.voteAverage),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: BlocBuilder<BookmarkCubit, BookmarkState>(
                        builder: (context, state) {
                          final isBookmarked = state.isBookmarked(movie.id);
                          return ElevatedButton.icon(
                            onPressed: () {
                              context.read<BookmarkCubit>().toggleBookmark(
                                movie,
                              );

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    isBookmarked
                                        ? '${movie.title} removed from My List'
                                        : '${movie.title} added to My List',
                                  ),
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                            },
                            icon: Icon(
                              isBookmarked
                                  ? Icons.bookmark
                                  : Icons.bookmark_border,
                            ),
                            label: Text(
                              isBookmarked ? 'In My List' : 'Add to My List',
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    IconButton(
                      onPressed: () => _shareMovie(movie),
                      icon: const Icon(Icons.share),
                      tooltip: 'Share Movie',
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Text(
                  'Synopsis',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                ExpandableText(
                  movie.overview.isNotEmpty
                      ? movie.overview
                      : 'No synopsis available.',
                  maxLines: 4,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(height: 1.5),
                ),
                const SizedBox(height: 32),
                _buildMovieStats(context, movie),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMovieStats(BuildContext context, Movie movie) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Details',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildStatRow(
          context,
          'Rating',
          '${movie.formattedRating}/10 (${movie.voteCount} votes)',
        ),
        _buildStatRow(
          context,
          'Release Date',
          '${movie.releaseDate.day}/${movie.releaseDate.month}/${movie.releaseDate.year}',
        ),
        _buildStatRow(context, 'Original Title', movie.originalTitle),
        _buildStatRow(
          context,
          'Language',
          movie.originalLanguage.toUpperCase(),
        ),
        _buildStatRow(
          context,
          'Popularity',
          movie.popularity.toStringAsFixed(1),
        ),
      ],
    );
  }

  Widget _buildStatRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(value, style: Theme.of(context).textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }

  void _shareMovie(Movie movie) {
    final deepLink = 'moviesapp://movie/${movie.id}';
    Share.share(
      'Check out "${movie.title}" (${movie.releaseYear})!\n\nRating: ${movie.formattedRating}/10\n\n$deepLink',
      subject: movie.title,
    );
  }
}
