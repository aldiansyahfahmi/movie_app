import 'package:dartz/dartz.dart';
import 'package:movie_app/features/home/data/repository/movie_repository_impl.dart';
import 'package:movie_app/features/home/domain/entities/response/movie_response_entity.dart';
import 'package:movie_app/features/home/domain/repository/movie_repository.dart';
import 'package:movie_app/shared_libraries/utils/error/failure_response.dart';
import 'package:movie_app/shared_libraries/utils/usecase/usecase.dart';

class GetNowPlayingMovieUseCase
    extends UseCase<List<MovieDataEntity>, NoParams> {
  final MovieRepository movieRepository = MovieRepositoryImpl();
  @override
  Future<Either<FailureResponse, List<MovieDataEntity>>> call(params) async =>
      await movieRepository.getNowPlayingMovie();
}
