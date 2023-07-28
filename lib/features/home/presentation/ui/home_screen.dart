import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/home/presentation/bloc/now_playing_movie_cubit/now_playing_movie_cubit.dart';
import 'package:movie_app/features/home/presentation/bloc/now_playing_movie_cubit/now_playing_movie_state.dart';
import 'package:movie_app/features/home/presentation/bloc/top_rated_movie_cubit/top_rated_movie_cubit.dart';
import 'package:movie_app/features/home/presentation/bloc/top_rated_movie_cubit/top_rated_movie_state.dart';
import 'package:movie_app/features/home/presentation/bloc/upcoming_movie_cubit/upcoming_movie_cubit.dart';
import 'package:movie_app/features/home/presentation/bloc/upcoming_movie_cubit/upcoming_movie_state.dart';
import 'package:movie_app/features/home/presentation/ui/component/list_movie.dart';
import 'package:movie_app/features/home/presentation/ui/component/loading.dart';
import 'package:movie_app/features/home/presentation/ui/component/search.dart';
import 'package:movie_app/shared_libraries/utils/resources/colors.gen.dart';
import 'package:movie_app/shared_libraries/utils/state/view_data_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Movie App',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorName.white,
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              const Search(),
              SizedBox(
                height: 24.h,
              ),
              Text(
                'Top Rated',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorName.white,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              BlocBuilder<TopRatedMovieCubit, TopRatedMovieState>(
                builder: (context, state) {
                  final status = state.topRatedMovieState.status;
                  if (status.isLoading) {
                    return const Loading();
                  } else if (status.isHasData) {
                    final data = state.topRatedMovieState.data!;
                    return ListMovie(
                      data: data,
                    );
                  } else if (status.isError) {
                    return Center(
                      child: Text(
                        state.topRatedMovieState.message,
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Now Playing',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorName.white,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              BlocBuilder<NowPlayingMovieCubit, NowPlayingMovieState>(
                builder: (context, state) {
                  final status = state.nowPlayingMovieState.status;
                  if (status.isLoading) {
                    return const Loading();
                  } else if (status.isHasData) {
                    final data = state.nowPlayingMovieState.data!;
                    return ListMovie(
                      data: data,
                    );
                  } else if (status.isError) {
                    return Center(
                      child: Text(
                        state.nowPlayingMovieState.message,
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Upcoming',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorName.white,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              BlocBuilder<UpcomingMovieCubit, UpcomingMovieState>(
                builder: (context, state) {
                  final status = state.upcomingMovieState.status;
                  if (status.isLoading) {
                    return const Loading();
                  } else if (status.isHasData) {
                    final data = state.upcomingMovieState.data!;
                    return ListMovie(
                      data: data,
                    );
                  } else if (status.isError) {
                    return Center(
                      child: Text(
                        state.upcomingMovieState.message,
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
