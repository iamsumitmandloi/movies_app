import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/movie.dart';
import 'shimmer_placeholder.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback onTap;
  final bool showBookmarkBadge;
  final VoidCallback? onBookmarkTap;

  const MovieCard({
    Key? key,
    required this.movie,
    required this.onTap,
    this.showBookmarkBadge = false,
    this.onBookmarkTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 2 / 3,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: movie.posterUrl.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: movie.posterUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: (_, __) => const ShimmerPlaceholder(),
                      errorWidget: (_, __, ___) => const MoviePosterError(),
                    )
                  : const MoviePosterError(),
            ),

            if (showBookmarkBadge && movie.isBookmarked)
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: onBookmarkTap,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Icon(
                      Icons.bookmark,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      movie.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 12),
                        const SizedBox(width: 2),
                        Text(
                          movie.formattedRating,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          movie.releaseYear,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MoviePosterError extends StatelessWidget {
  const MoviePosterError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.movie,
            size: 48,
            color: Theme.of(
              context,
            ).textTheme.bodySmall?.color?.withOpacity(0.5),
          ),
          const SizedBox(height: 8),
          Text(
            'No Image',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(
                context,
              ).textTheme.bodySmall?.color?.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
