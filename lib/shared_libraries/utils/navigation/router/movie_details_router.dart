import 'package:movie_app/shared_libraries/utils/navigation/arguments/credit_argument.dart';

import '../../navigation/navigation_helper.dart';
import 'app_routes.dart';

abstract class MovieDetailsRouter {
  void navigateToCreditScreen({required CreditArgument argument});
}

class MovieDetailsRouterImpl implements MovieDetailsRouter {
  NavigationHelper navigationHelper = NavigationHelperImpl();

  @override
  void navigateToCreditScreen({required CreditArgument argument}) {
    navigationHelper.pushNamed(
      AppRoutes.credits,
      arguments: argument,
    );
  }
}
