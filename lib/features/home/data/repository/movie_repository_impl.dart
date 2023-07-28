import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/features/home/data/datasources/remote/movie_remote_datasource.dart';
import 'package:movie_app/features/home/data/mapper/movie_mapper.dart';
import 'package:movie_app/features/home/domain/entities/response/movie_response_entity.dart';
import 'package:movie_app/features/home/domain/repository/movie_repository.dart';
import 'package:movie_app/shared_libraries/utils/constants/app_constants.dart';
import 'package:movie_app/shared_libraries/utils/error/failure_response.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource movieRemoteDataSource =
      MovieRemoteDataSourceImpl();
  final MovieMapper movieMapper = MovieMapper();

  @override
  Future<Either<FailureResponse, List<MovieDataEntity>>>
      getPopularMovie() async {
    try {
      final response = await movieRemoteDataSource.getPopularMovie();
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
}
