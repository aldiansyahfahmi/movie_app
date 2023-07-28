import 'package:movie_app/shared_libraries/utils/navigation/arguments/movie_details_argument.dart';

import '../../navigation/navigation_helper.dart';
import 'app_routes.dart';

abstract class HomeRouter {
  void navigateToMovieDetailsScreen({required MovieDetailsArgument argument});
}

class HomeRouterImpl implements HomeRouter {
  NavigationHelper navigationHelper = NavigationHelperImpl();

  @override
  void navigateToMovieDetailsScreen({required MovieDetailsArgument argument}) {
    navigationHelper.pushNamed(
      AppRoutes.movieDetails,
      arguments: argument,
    );
  }
}
