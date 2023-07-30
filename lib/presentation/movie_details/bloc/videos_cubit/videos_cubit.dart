import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domains/movie/domain/usecases/get_videos_usecase.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '/shared_libraries/utils/state/view_data_state.dart';
import 'videos_state.dart';

class VideosCubit extends Cubit<VideosState> {
  final GetVideosUseCase getVideosUseCase = GetVideosUseCase();

  VideosCubit() : super(VideosState(videosState: ViewData.initial()));

  int videoIndex = 0;
  List<YoutubePlayerController> ytControllers = [
    YoutubePlayerController(initialVideoId: '')
  ];

  void getVideos({required int id}) async {
    emit(VideosState(videosState: ViewData.loading()));
    final result = await getVideosUseCase.call(id);
    result.fold(
      (failure) => emit(
        VideosState(
          videosState: ViewData.error(
            message: failure.errorMessage,
            failure: failure,
          ),
        ),
      ),
      (result) {
        ytControllers = result
            .map(
              (video) => YoutubePlayerController(
                initialVideoId: video.key,
                flags: const YoutubePlayerFlags(
                  autoPlay: false,
                ),
              ),
            )
            .toList();
        emit(
          VideosState(
            videosState: ViewData.loaded(
              data: result,
            ),
          ),
        );
      },
    );
  }
}
