import '../../navigation/navigation_helper.dart';
import 'app_routes.dart';

abstract class HomeRouter {
  void navigateToOtherScreen();
}

class HomeRouterImpl implements HomeRouter {
  NavigationHelper navigationHelper = NavigationHelperImpl();

  @override
  void navigateToOtherScreen() {
    navigationHelper.pushNamed(AppRoutes.other);
  }
}
