import '../constants/api_constants.dart';

enum ImageSize {
  small('w185'),
  medium('w342'),
  large('w500'),
  original('original');

  const ImageSize(this.value);
  final String value;
}

class ImageUtils {
  static String getOptimizedImageUrl(String? path, ImageSize size) {
    if (path == null || path.isEmpty) return '';
    return '${ApiConstants.imageBaseUrl}/${size.value}$path';
  }

  static String getPosterUrl(
    String? path, {
    ImageSize size = ImageSize.medium,
  }) {
    return getOptimizedImageUrl(path, size);
  }

  static String getBackdropUrl(
    String? path, {
    ImageSize size = ImageSize.large,
  }) {
    return getOptimizedImageUrl(path, size);
  }
}
