import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/constants/breakpoints.dart';
import '../../../core/router/app_router.dart';
import '../../../domain/entities/movie.dart';
import '../../cubits/bookmark/bookmark_cubit.dart';
import '../../cubits/bookmark/bookmark_state.dart';
import '../../widgets/movie_grid.dart';

@RoutePage()
class BookmarksPage extends StatelessWidget {
  const BookmarksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My List'),
        actions: [
          BlocBuilder<BookmarkCubit, BookmarkState>(
            builder: (context, state) {
              if (state is BookmarkLoaded && state.bookmarks.isNotEmpty) {
                return IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () => _shareAllBookmarks(state.bookmarks),
                  tooltip: 'Share My List',
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
      body: BlocBuilder<BookmarkCubit, BookmarkState>(
        builder: (context, state) {
          if (state is BookmarkLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is BookmarkError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.grey),
                  const SizedBox(height: 16),
                  Text(
                    'Error Loading Bookmarks',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      state.message,
                      textAlign: TextAlign.center,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () =>
                        context.read<BookmarkCubit>().loadBookmarks(),
                    child: const Text('Try Again'),
                  ),
                ],
              ),
            );
          }

          if (state is BookmarkLoaded) {
            if (state.bookmarks.isEmpty) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.bookmark_border, size: 64, color: Colors.grey),
                    SizedBox(height: 16),
                    Text(
                      'No bookmarks yet',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Start adding movies to your list',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              );
            }

            return SingleChildScrollView(
              padding: EdgeInsets.all(
                ResponsiveUtils.getHorizontalPadding(context),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${state.bookmarks.length} movie${state.bookmarks.length == 1 ? '' : 's'} saved',
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  MovieGrid(
                    movies: state.bookmarks,
                    columns: ResponsiveUtils.getGridColumns(context),
                    showBookmarkBadge: true,
                    onMovieTap: (movie) {
                      context.router.push(
                        MovieDetailRoute(movie: movie),
                      );
                    },
                    onBookmarkTap: (movie) {
                      context.read<BookmarkCubit>().toggleBookmark(movie);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${movie.title} removed from My List'),
                          duration: const Duration(seconds: 2),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {
                              context.read<BookmarkCubit>().toggleBookmark(
                                movie,
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  void _shareAllBookmarks(List<Movie> bookmarks) {
    final movieList = bookmarks
        .map((m) => '• ${m.title} (${m.releaseYear})')
        .join('\n');

    Share.share(
      'My Movie List:\n\n$movieList\n\nShared from Movies App',
      subject: 'My Movie List',
    );
  }
}
