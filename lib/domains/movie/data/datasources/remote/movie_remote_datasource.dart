import 'package:dio/dio.dart';
import 'package:movie_app/di/injections.dart';
import 'package:movie_app/domains/movie/data/models/response/credits_response_dto.dart';
import 'package:movie_app/domains/movie/data/models/response/movie_response_dto.dart';
import 'package:movie_app/shared_libraries/core/network/models/api_response.dart';
import 'package:movie_app/shared_libraries/utils/constants/app_constants.dart';

abstract class MovieRemoteDataSource {
  Future<ApiResponse<List<MovieDataDto>>> getTopRatedMovie();
  Future<ApiResponse<List<MovieDataDto>>> getNowPlayingMovie();
  Future<ApiResponse<List<MovieDataDto>>> getUpcomingMovie();
  Future<MovieDataDto> getMovieDetails({required int id});
  Future<CreditsDto> getCredits({required int id});
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final Dio dio = sl();

  @override
  Future<ApiResponse<List<MovieDataDto>>> getTopRatedMovie() async {
    try {
      final response = await dio.get(AppConstants.appApi.topRatedMovie);
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

  @override
  Future<ApiResponse<List<MovieDataDto>>> getNowPlayingMovie() async {
    try {
      final response = await dio.get(AppConstants.appApi.nowPlayingMovie);
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

  @override
  Future<ApiResponse<List<MovieDataDto>>> getUpcomingMovie() async {
    try {
      final response = await dio.get(AppConstants.appApi.upcomingMovie);
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

  @override
  Future<MovieDataDto> getMovieDetails({required int id}) async {
    try {
      final response = await dio.get('${AppConstants.appApi.movie}/$id');
      return MovieDataDto.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CreditsDto> getCredits({required int id}) async {
    try {
      final response = await dio.get(
          '${AppConstants.appApi.movie}/$id/${AppConstants.appApi.credits}');
      return CreditsDto.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
