import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/home/presentation/bloc/popular_movie_cubit/popular_movie_cubit.dart';
import 'package:movie_app/features/home/presentation/bloc/popular_movie_cubit/popular_movie_state.dart';
import 'package:movie_app/shared_libraries/utils/resources/colors.gen.dart';
import 'package:movie_app/shared_libraries/utils/state/view_data_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<PopularMovieCubit, PopularMovieState>(
          builder: (context, state) {
            final status = state.popularMovieState.status;
            if (status.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (status.isHasData) {
              return Padding(
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
                  ],
                ),
              );
            } else if (status.isError) {
              return Center(
                child: Text(
                  state.popularMovieState.message,
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
