import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/presentation/movie/bloc/upcoming_movie_cubit/upcoming_movie_cubit.dart';
import 'package:movie_app/presentation/movie/bloc/upcoming_movie_cubit/upcoming_movie_state.dart';
import 'package:movie_app/shared_libraries/component/movie/list_movie.dart';
import 'package:movie_app/shared_libraries/component/shimmer/movies_shimmer.dart';
import 'package:movie_app/shared_libraries/component/view/error_view.dart';
import 'package:movie_app/shared_libraries/utils/resources/colors.gen.dart';
import 'package:movie_app/shared_libraries/utils/state/view_data_state.dart';

class UpcomingMovie extends StatelessWidget {
  const UpcomingMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Up Coming',
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
            return state.upcomingMovieState.observe(
              onLoading: const MoviesShimmer(),
              onError: (error) => ErrorView(
                error: error!,
                onTap: () =>
                    context.read<UpcomingMovieCubit>().getUpcomingMovie(),
              ),
              (data) => ListMovie(data: data!),
            );
          },
        ),
      ],
    );
  }
}
