class ApiConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p';
  static const String apiKey =
      '9f5fe353609a38481153bc7cd11ede86';

  static const String trendingMovies = '/trending/movie/day';
  static const String nowPlayingMovies = '/movie/now_playing';
  static const String searchMovies = '/search/movie';
  static const String movieDetails = '/movie';

  static const String posterSmall = 'w185';
  static const String posterMedium = 'w342';
  static const String posterLarge = 'w500';
  static const String backdropSmall = 'w780';
  static const String backdropLarge = 'w1280';
  static const String original = 'original';
}

class AppConstants {
  static const String appName = 'Movies App';
  static const String defaultLanguage = 'en-US';
  static const int itemsPerPage = 20;
  static const int searchDebounceMs = 500;
  static const int cacheRefreshIntervalMinutes = 30;
  static const int maxCacheAgeHours = 24;
}

class DatabaseConstants {
  static const String dbName = 'movies_app.db';
  static const int dbVersion = 1;
  static const String moviesTable = 'movies';
  static const String cacheMetadataTable = 'cache_metadata';
}
