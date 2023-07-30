import 'package:movie_app/domains/movie/data/mapper/movie_mapper.dart';
import 'package:movie_app/domains/movie/data/models/response/movie_response_dto.dart';
import 'package:movie_app/domains/movie/domain/entities/response/movie_response_entity.dart';
import 'package:movie_app/shared_libraries/core/network/models/api_response.dart';
import 'package:movie_app/shared_libraries/core/network/models/api_response_entity.dart';

class GlobalMapper {
  final MovieMapper movieMapper = MovieMapper();
  ApiResponseEntity<List<MovieDataEntity>> mapApiResponseToApiResponseEntity(
          ApiResponse<List<MovieDataDto>> data) =>
      ApiResponseEntity(
        page: data.page ?? 0,
        results: movieMapper.mapMovieDataDtoToEntity(data.results ?? []),
        totalPages: data.totalPages ?? 0,
        totalResults: data.totalResults ?? 0,
      );
}
