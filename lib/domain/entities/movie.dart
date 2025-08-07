import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/utils/image_utils.dart';

part 'movie.freezed.dart';

@freezed
class Movie with _$Movie {
  const factory Movie({
    required int id,
    required String title,
    required String overview,
    String? posterPath,
    String? backdropPath,
    required double voteAverage,
    required int voteCount,
    required DateTime releaseDate,
    required List<int> genreIds,
    required String originalLanguage,
    required String originalTitle,
    required bool adult,
    required double popularity,
    @Default(false) bool isBookmarked,
  }) = _Movie;

  const Movie._();

  String get posterUrl => ImageUtils.getPosterUrl(posterPath);
  String get backdropUrl => ImageUtils.getBackdropUrl(backdropPath);
  String get releaseYear => releaseDate.year.toString();
  String get formattedRating => voteAverage.toStringAsFixed(1);
}
