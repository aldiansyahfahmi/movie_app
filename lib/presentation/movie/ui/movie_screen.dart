import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/presentation/movie/bloc/now_playing_movie_cubit/now_playing_movie_cubit.dart';
import 'package:movie_app/presentation/movie/bloc/now_playing_movie_cubit/now_playing_movie_state.dart';
import 'package:movie_app/shared_libraries/component/banner/movies_banner.dart';
import 'package:movie_app/presentation/movie/ui/component/top_rated_movie.dart';
import 'package:movie_app/presentation/movie/ui/component/trending_movie.dart';
import 'package:movie_app/presentation/movie/ui/component/upcoming_movie.dart';
import 'package:movie_app/shared_libraries/component/shimmer/banner_shimmer.dart';
import 'package:movie_app/shared_libraries/component/view/error_view.dart';
import 'package:movie_app/shared_libraries/utils/resources/colors.gen.dart';
import 'package:movie_app/shared_libraries/utils/state/view_data_state.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                  child: Text(
                    'Movies',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorName.white,
                    ),
                  ),
                ),
              ),
              BlocBuilder<NowPlayingMovieCubit, NowPlayingMovieState>(
                builder: (context, state) {
                  return state.nowPlayingMovieState.observe(
                      onLoading: const BannerShimmer(),
                      onError: (error) => ErrorView(
                            error: error!,
                            onTap: () => context
                                .read<NowPlayingMovieCubit>()
                                .getNowPlayingMovie(),
                          ),
                      (data) => MoviesBanner(data: data!));
                },
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TrendingMovie(),
                    SizedBox(
                      height: 16.h,
                    ),
                    const UpcomingMovie(),
                    SizedBox(
                      height: 16.h,
                    ),
                    const TopRatedMovie(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
