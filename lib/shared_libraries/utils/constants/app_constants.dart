class AppConstants {
  const AppConstants();

  static App app = const App();
  static CachedKey cachedKey = const CachedKey();
  static AppApi appApi = const AppApi();
  static ErrorKey errorKey = const ErrorKey();
}

class App {
  const App();

  String get appName => "Movie App";

  String get day => 'day';
  String get week => 'week';

  String get imageUrl => 'https://www.themoviedb.org/t/p';
  String get posterSize => 'w600_and_h900_bestv2';
  String get backdropSize => 'w1066_and_h600_bestv2';
  String get posterImageUrl => '$imageUrl/$posterSize';
  String get backdropImageUrl => '$imageUrl/$backdropSize';
}

class CachedKey {
  const CachedKey();

  String get tokenKey => 'tokenKey';
}

class AppApi {
  const AppApi();
  String get key => '9d1d0ba6ed07c430140ed34dd0684540';

  String get baseUrlDevelopment => 'https://api.themoviedb.org/3/';
  String get baseUrlProduction => 'https://api.themoviedb.org/3/';

  String get movie => 'movie';
  String get topRatedMovie => '$movie/top_rated';
  String get nowPlayingMovie => '$movie/now_playing';
  String get upcomingMovie => '$movie/upcoming';
  String get credits => 'credits';
  String get videos => 'videos';
  String get trandingMovie => 'trending/movie';
}

class ErrorKey {
  const ErrorKey();

  String get message => "status_message";
}
