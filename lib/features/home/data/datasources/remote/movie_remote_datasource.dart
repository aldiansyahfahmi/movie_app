import 'package:dio/dio.dart';
import 'package:movie_app/di/injections.dart';
import 'package:movie_app/features/home/data/models/response/movie_response_dto.dart';
import 'package:movie_app/shared_libraries/core/network/models/api_response.dart';
import 'package:movie_app/shared_libraries/utils/constants/app_constants.dart';

abstract class MovieRemoteDataSource {
  Future<ApiResponse<List<MovieDataDto>>> getPopularMovie();
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final Dio dio = sl();
  @override
  Future<ApiResponse<List<MovieDataDto>>> getPopularMovie() async {
    try {
      final response = await dio.get(AppConstants.appApi.popularMovie);
      return ApiResponse.fromJson(
        response.data,
        onDataDeserialized: (json) => List<MovieDataDto>.from(
          json.map(
            (x) => MovieDataDto.fromJson(x),
          ),
        ),
      );
    } catch (e) {
      rethrow;
    }
  }
}
