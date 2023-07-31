import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/presentation/movie/bloc/top_rated_movie_cubit/top_rated_movie_cubit.dart';
import 'package:movie_app/presentation/movie/bloc/top_rated_movie_cubit/top_rated_movie_state.dart';
import 'package:movie_app/presentation/movie/ui/component/list_movie.dart';
import 'package:movie_app/shared_libraries/component/loading/movie_loading.dart';
import 'package:movie_app/shared_libraries/component/view/error_view.dart';
import 'package:movie_app/shared_libraries/utils/resources/colors.gen.dart';
import 'package:movie_app/shared_libraries/utils/state/view_data_state.dart';

class TopRatedMovie extends StatelessWidget {
  const TopRatedMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
            return state.topRatedMovieState.observe(
              onLoading: const MovieLoading(),
              onError: (error) => ErrorView(
                error: error!,
                onTap: () =>
                    context.read<TopRatedMovieCubit>().getTopRatedMovie(),
              ),
              (data) => ListMovie(data: data!),
            );
          },
        ),
      ],
    );
  }
}
