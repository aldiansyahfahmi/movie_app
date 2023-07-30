import 'package:movie_app/shared_libraries/utils/navigation/arguments/movie_details_argument.dart';

import '../../navigation/navigation_helper.dart';
import 'app_routes.dart';

abstract class MovieRouter {
  void navigateToMovieDetailsScreen({required MovieDetailsArgument argument});
  void navigateToTopRatedMoviesScreen();
}

class MovieRouterImpl implements MovieRouter {
  NavigationHelper navigationHelper = NavigationHelperImpl();

  @override
  void navigateToMovieDetailsScreen({required MovieDetailsArgument argument}) {
    navigationHelper.pushNamed(
      AppRoutes.movieDetails,
      arguments: argument,
    );
  }

  @override
  void navigateToTopRatedMoviesScreen() => navigationHelper.pushNamed(
        AppRoutes.topRatedMovies,
      );
}
