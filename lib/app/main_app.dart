import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/presentation/movie_details/bloc/credits_cubit/credits_cubit.dart';
import 'package:movie_app/presentation/movie_details/bloc/movie_details_cubit/movie_details_cubit.dart';
import 'package:movie_app/presentation/movie/bloc/now_playing_movie_cubit/now_playing_movie_cubit.dart';
import 'package:movie_app/presentation/movie/bloc/top_rated_movie_cubit/top_rated_movie_cubit.dart';
import 'package:movie_app/presentation/movie/bloc/upcoming_movie_cubit/upcoming_movie_cubit.dart';
import 'package:movie_app/presentation/movie_details/ui/movie_details_screen.dart';
import 'package:movie_app/presentation/movie/ui/movie_screen.dart';
import 'package:movie_app/shared_libraries/utils/navigation/arguments/movie_details_argument.dart';
import 'package:movie_app/shared_libraries/utils/resources/colors.gen.dart';
import 'package:page_transition/page_transition.dart';
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
          home: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => TopRatedMovieCubit()..getTopRatedMovie(),
              ),
              BlocProvider(
                create: (context) =>
                    NowPlayingMovieCubit()..getNowPlayingMovie(),
              ),
              BlocProvider(
                create: (context) => UpcomingMovieCubit()..getUpcomingMovie(),
              ),
            ],
            child: const MovieScreen(),
          ),
          navigatorKey: NavigationHelperImpl.navigatorKey,
          onGenerateRoute: (settings) {
            final arguments = settings.arguments;
            switch (settings.name) {
              case AppRoutes.home:
                return PageTransition(
                  child: MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) =>
                            TopRatedMovieCubit()..getTopRatedMovie(),
                      ),
                      BlocProvider(
                        create: (context) =>
                            NowPlayingMovieCubit()..getNowPlayingMovie(),
                      ),
                      BlocProvider(
                        create: (context) =>
                            UpcomingMovieCubit()..getUpcomingMovie(),
                      ),
                    ],
                    child: const MovieScreen(),
                  ),
                  type: PageTransitionType.rightToLeft,
                );
              case AppRoutes.movieDetails:
                return PageTransition(
                  child: MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => MovieDetailsCubit(),
                      ),
                      BlocProvider(
                        create: (context) => CreditsCubit(),
                      ),
                    ],
                    child: MovieDetailsScreen(
                      arguments: arguments as MovieDetailsArgument,
                    ),
                  ),
                  type: PageTransitionType.rightToLeft,
                );
              default:
                return PageTransition(
                  child: const MovieScreen(),
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
