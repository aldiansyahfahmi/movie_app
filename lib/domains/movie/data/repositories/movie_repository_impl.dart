import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/domains/movie/data/datasources/remote/movie_remote_datasource.dart';
import 'package:movie_app/domains/movie/data/mapper/credits_mapper.dart';
import 'package:movie_app/domains/movie/data/mapper/movie_mapper.dart';
import 'package:movie_app/domains/movie/domain/entities/response/credits_response_entity.dart';
import 'package:movie_app/domains/movie/domain/entities/response/movie_response_entity.dart';
import 'package:movie_app/domains/movie/domain/repositories/movie_repository.dart';
import 'package:movie_app/shared_libraries/utils/constants/app_constants.dart';
import 'package:movie_app/shared_libraries/utils/error/failure_response.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource movieRemoteDataSource =
      MovieRemoteDataSourceImpl();
  final MovieMapper movieMapper = MovieMapper();
  final CreditsMapper creditsMapper = CreditsMapper();

  @override
  Future<Either<FailureResponse, List<MovieDataEntity>>>
      getTopRatedMovie() async {
    try {
      final response = await movieRemoteDataSource.getTopRatedMovie();
      return Right(movieMapper.mapMovieDataDtoToEntity(response.results!));
    } on DioException catch (error) {
      return Left(
        FailureResponse(
          errorMessage:
              error.response?.data[AppConstants.errorKey.message]?.toString() ??
                  error.response.toString(),
          statusCode: error.response?.statusCode ?? 500,
        ),
      );
    }
  }

  @override
  Future<Either<FailureResponse, List<MovieDataEntity>>>
      getNowPlayingMovie() async {
    try {
      final response = await movieRemoteDataSource.getNowPlayingMovie();
      return Right(movieMapper.mapMovieDataDtoToEntity(response.results!));
    } on DioException catch (error) {
      return Left(
        FailureResponse(
          errorMessage:
              error.response?.data[AppConstants.errorKey.message]?.toString() ??
                  error.response.toString(),
          statusCode: error.response?.statusCode ?? 500,
        ),
      );
    }
  }

  @override
  Future<Either<FailureResponse, List<MovieDataEntity>>>
      getUpcomingMovie() async {
    try {
      final response = await movieRemoteDataSource.getUpcomingMovie();
      return Right(movieMapper.mapMovieDataDtoToEntity(response.results!));
    } on DioException catch (error) {
      return Left(
        FailureResponse(
          errorMessage:
              error.response?.data[AppConstants.errorKey.message]?.toString() ??
                  error.response.toString(),
          statusCode: error.response?.statusCode ?? 500,
        ),
      );
    }
  }

  @override
  Future<Either<FailureResponse, MovieDataEntity>> getMovieDetails(
      {required int id}) async {
    try {
      final response = await movieRemoteDataSource.getMovieDetails(id: id);
      return Right(movieMapper.mapMovieDataDtoToMovieDataEntity(response));
    } on DioException catch (error) {
      return Left(
        FailureResponse(
          errorMessage:
              error.response?.data[AppConstants.errorKey.message]?.toString() ??
                  error.response.toString(),
          statusCode: error.response?.statusCode ?? 500,
        ),
      );
    }
  }

  @override
  Future<Either<FailureResponse, CreditsEntity>> getCredits(
      {required int id}) async {
    try {
      final response = await movieRemoteDataSource.getCredits(id: id);
      return Right(creditsMapper.mapCreditsDtoToCreditsEntity(response));
    } on DioException catch (error) {
      return Left(
        FailureResponse(
          errorMessage:
              error.response?.data[AppConstants.errorKey.message]?.toString() ??
                  error.response.toString(),
          statusCode: error.response?.statusCode ?? 500,
        ),
      );
    }
  }
}
