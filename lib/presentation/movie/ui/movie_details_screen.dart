import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/presentation/movie/bloc/movie_details_cubit/movie_details_cubit.dart';
import 'package:movie_app/presentation/movie/bloc/movie_details_cubit/movie_details_state.dart';
import 'package:movie_app/presentation/movie/ui/component/movie_details/backdrop.dart';
import 'package:movie_app/presentation/movie/ui/component/movie_details/poster.dart';
import 'package:movie_app/shared_libraries/utils/navigation/arguments/movie_details_argument.dart';
import 'package:movie_app/shared_libraries/utils/resources/colors.gen.dart';
import 'package:movie_app/shared_libraries/utils/state/view_data_state.dart';

class MovieDetailsScreen extends StatefulWidget {
  final MovieDetailsArgument arguments;
  const MovieDetailsScreen({super.key, required this.arguments});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  void getMovieDetails() {
    context.read<MovieDetailsCubit>().getMovieDetails(
          id: widget.arguments.movieDataEntity.id,
        );
  }

  @override
  void initState() {
    getMovieDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
          final status = state.movieDetailsState.status;
          if (status.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (status.isHasData) {
            final movie = state.movieDetailsState.data!;
            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Backdrop(movie: movie),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 45,
                          ),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorName.white.withOpacity(0.20),
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: ColorName.white,
                          ),
                        ),
                      ),
                      Poster(movie: movie),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.overview,
                          style: TextStyle(
                            color: ColorName.white.withOpacity(0.80),
                            fontSize: 14.sp,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (status.isError) {
            return Center(
              child: Text(
                state.movieDetailsState.message,
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}