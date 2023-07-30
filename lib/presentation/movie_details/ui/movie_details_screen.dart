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
import 'package:movie_app/presentation/movie_details/ui/component/genres.dart';
import 'package:movie_app/presentation/movie_details/ui/component/loading/credit_loading.dart';
import 'package:movie_app/presentation/movie_details/ui/component/loading/detail_loading.dart';
import 'package:movie_app/presentation/movie_details/ui/component/loading/video_loading.dart';
import 'package:movie_app/presentation/movie_details/ui/component/poster.dart';
import 'package:movie_app/presentation/movie_details/ui/component/videos.dart';
import 'package:movie_app/shared_libraries/component/button/custom_back_button.dart';
import 'package:movie_app/shared_libraries/component/view/error_view.dart';
import 'package:movie_app/shared_libraries/utils/navigation/arguments/movie_details_argument.dart';
import 'package:movie_app/shared_libraries/utils/resources/colors.gen.dart';
import 'package:movie_app/shared_libraries/utils/state/view_data_state.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
    getMovieDetails();
    getCredits();
    getVideos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final videoCubit = context.read<VideosCubit>();
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: videoCubit.ytControllers[videoCubit.videoIndex],
      ),
      builder: (context, player) {
        return Scaffold(
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
                      builder: (context, state) {
                        return state.movieDetailsState.observe(
                          onLoading: const DetailLoading(),
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
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Genres(movie: movie),
                                    SizedBox(
                                      height: 16.h,
                                    ),
                                    Text(
                                      'Storyline',
                                      style: TextStyle(
                                        color: ColorName.white,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Text(
                                      movie.overview,
                                      style: TextStyle(
                                        color:
                                            ColorName.white.withOpacity(0.80),
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
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          BlocBuilder<VideosCubit, VideosState>(
                            builder: (context, state) {
                              return state.videosState.observe(
                                onLoading: const VideoLoading(),
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
                                onLoading: const CreditLoading(),
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
              const SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: CustomBackButton(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
