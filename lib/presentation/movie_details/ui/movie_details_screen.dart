import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/presentation/movie_details/bloc/credits_cubit/credits_cubit.dart';
import 'package:movie_app/presentation/movie_details/bloc/credits_cubit/credits_state.dart';
import 'package:movie_app/presentation/movie_details/bloc/movie_details_cubit/movie_details_cubit.dart';
import 'package:movie_app/presentation/movie_details/bloc/movie_details_cubit/movie_details_state.dart';
import 'package:movie_app/presentation/movie_details/bloc/videos_cubit/videos_cubit.dart';
import 'package:movie_app/presentation/movie_details/bloc/videos_cubit/videos_state.dart';
import 'package:movie_app/presentation/movie_details/ui/component/backdrop.dart';
import 'package:movie_app/presentation/movie_details/ui/component/credits.dart';
import 'package:movie_app/presentation/movie_details/ui/component/poster.dart';
import 'package:movie_app/presentation/movie_details/ui/component/storline.dart';
import 'package:movie_app/presentation/movie_details/ui/component/videos.dart';
import 'package:movie_app/shared_libraries/component/appbar/custom_appbar.dart';
import 'package:movie_app/shared_libraries/component/shimmer/credit_movie_details_shimmer.dart';
import 'package:movie_app/shared_libraries/component/shimmer/movie_details_shimmer.dart';
import 'package:movie_app/shared_libraries/component/shimmer/video_shimmer.dart';
import 'package:movie_app/shared_libraries/component/view/error_view.dart';
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
  late final ScrollController scrollController;
  double scrollControllerOffset = 0.0;

  void scrollListener() {
    setState(() {
      scrollControllerOffset = scrollController.offset;
    });
  }

  void getMovieDetails() {
    context.read<MovieDetailsCubit>().getMovieDetails(
          id: widget.arguments.movieDataEntity.id,
        );
  }

  void getCredits() {
    context.read<CreditsCubit>().getCredits(
          id: widget.arguments.movieDataEntity.id,
        );
  }

  void getVideos() {
    context.read<VideosCubit>().getVideos(
          id: widget.arguments.movieDataEntity.id,
        );
  }

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
    getMovieDetails();
    getCredits();
    getVideos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
                  builder: (context, state) {
                    return state.movieDetailsState.observe(
                      onLoading: const MovieDetailsShimmer(),
                      onError: (error) => ErrorView(
                        error: error!,
                        onTap: () => getMovieDetails(),
                      ),
                      (movie) => Column(
                        children: [
                          Stack(
                            children: [
                              Backdrop(movie: movie!),
                              Poster(movie: movie),
                            ],
                          ),
                          Storyline(movie: movie),
                        ],
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocBuilder<VideosCubit, VideosState>(
                        builder: (context, state) {
                          return state.videosState.observe(
                            onLoading: const VideoShimmer(),
                            onError: (error) => ErrorView(
                              error: error!,
                              onTap: () => getVideos(),
                            ),
                            (data) {
                              return Videos(data: data!);
                            },
                          );
                        },
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      BlocBuilder<CreditsCubit, CreditsState>(
                        builder: (context, state) {
                          return state.creditsState.observe(
                            onLoading: const CreditMovieDetailsShimmer(),
                            onError: (error) => ErrorView(
                              error: error!,
                              onTap: () => getCredits(),
                            ),
                            (data) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Credits(
                                  movideId: data!.id,
                                  creditName: 'Cast',
                                  data: data.cast,
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                Credits(
                                  movideId: data.id,
                                  creditName: 'Crew',
                                  data: data.crew,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          CustomAppBar(
            title: '',
            color: ColorName.black.withOpacity(
              (scrollControllerOffset / 350).clamp(0, 1).toDouble(),
            ),
          ),
        ],
      ),
    );
  }
}
