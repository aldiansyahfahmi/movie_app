import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/presentation/movie/bloc/now_playing_movie_cubit/now_playing_movie_cubit.dart';
import 'package:movie_app/presentation/movie/bloc/now_playing_movie_cubit/now_playing_movie_state.dart';
import 'package:movie_app/presentation/movie/bloc/top_rated_movie_cubit/top_rated_movie_cubit.dart';
import 'package:movie_app/presentation/movie/bloc/trending_movie_cubit/trending_movie_cubit.dart';
import 'package:movie_app/presentation/movie/bloc/upcoming_movie_cubit/upcoming_movie_cubit.dart';
import 'package:movie_app/shared_libraries/component/banner/movies_banner.dart';
import 'package:movie_app/presentation/movie/ui/component/top_rated_movie.dart';
import 'package:movie_app/presentation/movie/ui/component/trending_movie.dart';
import 'package:movie_app/presentation/movie/ui/component/upcoming_movie.dart';
import 'package:movie_app/shared_libraries/component/shimmer/banner_shimmer.dart';
import 'package:movie_app/shared_libraries/component/view/error_view.dart';
import 'package:movie_app/shared_libraries/utils/constants/app_constants.dart';
import 'package:movie_app/shared_libraries/utils/resources/colors.gen.dart';
import 'package:movie_app/shared_libraries/utils/state/view_data_state.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorName.black,
        centerTitle: true,
        title: Text(
          'Movies',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: ColorName.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.light_mode,
              color: ColorName.white,
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<NowPlayingMovieCubit>().getNowPlayingMovie();
          context.read<TrendingMovieCubit>().getTrendingMovie(
                timeWindow: AppConstants.app.day,
              );
          context.read<UpcomingMovieCubit>().getUpcomingMovie();
          context.read<TopRatedMovieCubit>().getTopRatedMovie();
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              Column(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
