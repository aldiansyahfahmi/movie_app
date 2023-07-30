import 'package:dio/dio.dart';
import 'package:movie_app/di/injections.dart';
import 'package:movie_app/domains/movie/data/models/response/credits_response_dto.dart';
import 'package:movie_app/domains/movie/data/models/response/movie_response_dto.dart';
import 'package:movie_app/domains/movie/data/models/response/video_response_dto.dart';
import 'package:movie_app/shared_libraries/core/network/models/api_response.dart';
import 'package:movie_app/shared_libraries/utils/constants/app_constants.dart';

abstract class MovieRemoteDataSource {
  Future<ApiResponse<List<MovieDataDto>>> getTopRatedMovie({required int page});
  Future<ApiResponse<List<MovieDataDto>>> getNowPlayingMovie();
  Future<ApiResponse<List<MovieDataDto>>> getUpcomingMovie();
  Future<ApiResponse<List<MovieDataDto>>> getTrendingMovie(
      {required String timeWindow});
  Future<MovieDataDto> getMovieDetails({required int id});
  Future<CreditsDto> getCredits({required int id});
  Future<ApiResponse<List<VideoDataDto>>> getVideos({required int id});
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final Dio dio = sl();

  @override
  Future<ApiResponse<List<MovieDataDto>>> getTopRatedMovie(
      {required int page}) async {
    try {
      final response = await dio.get(
        AppConstants.appApi.topRatedMovie,
        queryParameters: {
          'page': page,
        },
      );
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

  @override
  Future<ApiResponse<List<VideoDataDto>>> getVideos({required int id}) async {
    try {
      final response = await dio.get(
          '${AppConstants.appApi.movie}/$id/${AppConstants.appApi.videos}');
      return ApiResponse.fromJson(
        response.data,
        onDataDeserialized: (json) => List<VideoDataDto>.from(
          json.map(
            (x) => VideoDataDto.fromJson(x),
          ),
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ApiResponse<List<MovieDataDto>>> getTrendingMovie(
      {required String timeWindow}) async {
    try {
      final response =
          await dio.get('${AppConstants.appApi.trandingMovie}/$timeWindow');
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
