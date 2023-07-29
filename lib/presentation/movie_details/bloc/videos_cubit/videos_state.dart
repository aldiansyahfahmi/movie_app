import 'package:equatable/equatable.dart';
import 'package:movie_app/domains/movie/domain/entities/response/video_response_entity.dart';
import '/shared_libraries/utils/state/view_data_state.dart';

class VideosState extends Equatable {
  final ViewData<List<VideoDataEntity>> videosState;

  const VideosState({required this.videosState});

  @override
  List<Object?> get props => [videosState];
}
