class AppConstants {
  const AppConstants();

  static App app = const App();
  static CachedKey cachedKey = const CachedKey();
  static AppApi appApi = const AppApi();
  static ErrorKey errorKey = const ErrorKey();
  static ErrorMessage errorMessage = const ErrorMessage();
}

class App {
  const App();

  double get defaultMargin => 16.0;
  String get appName => "YOUR-APP-NAME";
  String get androidAppId => '';
  String get iosAppId => '';
}

class CachedKey {
  const CachedKey();

  String get tokenKey => 'tokenKey';
  String get roleKey => 'roleKey';
}

class AppApi {
  const AppApi();
  String get key => '9d1d0ba6ed07c430140ed34dd0684540';
  String get baseUrlDevelopment => 'https://api.themoviedb.org/3/';
  String get baseUrlProduction => 'https://api.themoviedb.org/3/';

  String get popularMovie => 'movie/popular';
}

class ErrorKey {
  const ErrorKey();

  String get message => "message";
}

class ErrorMessage {
  const ErrorMessage();

  String get failedGetToken => 'failed get token';
  String get failedGetRole => 'failed get role';
}
