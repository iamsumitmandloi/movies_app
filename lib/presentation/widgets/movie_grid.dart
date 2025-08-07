import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constants/breakpoints.dart';
import '../../domain/entities/movie.dart';
import 'movie_card.dart';

class MovieGrid extends StatelessWidget {
  final List<Movie> movies;
  final int? columns;
  final bool showBookmarkBadge;
  final Function(Movie)? onBookmarkTap;
  final Function(Movie)? onMovieTap;

  const MovieGrid({
    Key? key,
    required this.movies,
    this.columns,
    this.showBookmarkBadge = false,
    this.onBookmarkTap,
    this.onMovieTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gridColumns = columns ?? ResponsiveUtils.getGridColumns(context);

    if (movies.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.movie_outlined, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'No movies found',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: gridColumns,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 2 / 3,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return MovieCard(
          movie: movie,
          showBookmarkBadge: showBookmarkBadge,
          onTap: () {
            // Dismiss keyboard when navigating to movie detail
            SystemChannels.textInput.invokeMethod('TextInput.hide');
            onMovieTap?.call(movie);
          },
          onBookmarkTap: () => onBookmarkTap?.call(movie),
        );
      },
    );
  }
}
