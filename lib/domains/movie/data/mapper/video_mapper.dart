import 'package:movie_app/domains/movie/data/models/response/video_response_dto.dart';
import 'package:movie_app/domains/movie/domain/entities/response/video_response_entity.dart';

class VideoMapper {
  List<VideoDataEntity> mapVideoDataDtoToEntity(List<VideoDataDto> data) {
    List<VideoDataEntity> entity = <VideoDataEntity>[];

    for (VideoDataDto element in data) {
      entity.add(
        mapVideoDataDtoToVideoDataEntity(element),
      );
    }

    return entity;
  }

  VideoDataEntity mapVideoDataDtoToVideoDataEntity(VideoDataDto data) =>
      VideoDataEntity(
        iso6391: data.iso6391 ?? '',
        iso31661: data.iso31661 ?? '',
        name: data.name ?? '',
        key: data.key ?? '',
        site: data.site ?? '',
        size: data.size ?? 0,
        type: data.type ?? '',
        official: data.official ?? false,
        publishedAt: data.publishedAt ?? DateTime.now(),
        id: data.id ?? '',
      );
}
