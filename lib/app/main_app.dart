import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/home/presentation/bloc/popular_movie_cubit/popular_movie_cubit.dart';
import 'package:movie_app/shared_libraries/utils/resources/colors.gen.dart';
import 'package:page_transition/page_transition.dart';
import '../features/home/presentation/ui/home_screen.dart';
import '../shared_libraries/utils/constants/app_constants.dart';
import '../shared_libraries/utils/navigation/navigation_helper.dart';
import '../shared_libraries/utils/navigation/router/app_routes.dart';
import '../shared_libraries/utils/setup/app_setup.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: AppConstants.app.appName,
          debugShowCheckedModeBanner: Config.isDebug,
          theme: ThemeData(
            scaffoldBackgroundColor: ColorName.black,
          ),
          builder: (context, child) {
            return ScrollConfiguration(
              behavior: MyBehavior(),
              child: child!,
            );
          },
          home: BlocProvider(
            create: (context) => PopularMovieCubit()..getPopularMovie(),
            child: const HomeScreen(),
          ),
          navigatorKey: NavigationHelperImpl.navigatorKey,
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case AppRoutes.home:
                return PageTransition(
                  child: BlocProvider(
                    create: (context) => PopularMovieCubit()..getPopularMovie(),
                    child: const HomeScreen(),
                  ),
                  type: PageTransitionType.rightToLeft,
                );
              default:
                return PageTransition(
                  child: const HomeScreen(),
                  type: PageTransitionType.rightToLeft,
                );
            }
          },
        );
      },
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(context, child, details) {
    return child;
  }
}
