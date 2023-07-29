import 'package:dartz/dartz.dart';
import 'package:movie_app/domains/movie/data/repositories/movie_repository_impl.dart';
import 'package:movie_app/domains/movie/domain/entities/response/movie_response_entity.dart';
import 'package:movie_app/domains/movie/domain/repositories/movie_repository.dart';
import 'package:movie_app/shared_libraries/utils/error/failure_response.dart';
import 'package:movie_app/shared_libraries/utils/usecase/usecase.dart';

class GetMovieDetailsUseCase extends UseCase<MovieDataEntity, int> {
  final MovieRepository movieRepository = MovieRepositoryImpl();
  @override
  Future<Either<FailureResponse, MovieDataEntity>> call(params) async =>
      await movieRepository.getMovieDetails(id: params);
}
