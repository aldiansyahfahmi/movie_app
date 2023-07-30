import 'package:dartz/dartz.dart';
import 'package:movie_app/domains/movie/domain/entities/response/credits_response_entity.dart';
import 'package:movie_app/domains/movie/domain/entities/response/movie_response_entity.dart';
import 'package:movie_app/domains/movie/domain/entities/response/video_response_entity.dart';
import 'package:movie_app/shared_libraries/core/network/models/api_response_entity.dart';
import 'package:movie_app/shared_libraries/utils/error/failure_response.dart';

abstract class MovieRepository {
  Future<Either<FailureResponse, ApiResponseEntity<List<MovieDataEntity>>>>
      getTopRatedMovie({required int page});
  Future<Either<FailureResponse, List<MovieDataEntity>>> getNowPlayingMovie();
  Future<Either<FailureResponse, List<MovieDataEntity>>> getUpcomingMovie();
  Future<Either<FailureResponse, List<MovieDataEntity>>> getTrendingMovie(
      {required String timeWindow});
  Future<Either<FailureResponse, MovieDataEntity>> getMovieDetails(
      {required int id});
  Future<Either<FailureResponse, CreditsEntity>> getCredits({required int id});
  Future<Either<FailureResponse, List<VideoDataEntity>>> getVideos(
      {required int id});
}
