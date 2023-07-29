import 'package:dartz/dartz.dart';
import 'package:movie_app/domains/movie/data/repositories/movie_repository_impl.dart';
import 'package:movie_app/domains/movie/domain/entities/response/video_response_entity.dart';
import 'package:movie_app/domains/movie/domain/repositories/movie_repository.dart';
import 'package:movie_app/shared_libraries/utils/error/failure_response.dart';
import 'package:movie_app/shared_libraries/utils/usecase/usecase.dart';

class GetVideosUseCase extends UseCase<List<VideoDataEntity>, int> {
  final MovieRepository movieRepository = MovieRepositoryImpl();
  @override
  Future<Either<FailureResponse, List<VideoDataEntity>>> call(params) async =>
      await movieRepository.getVideos(id: params);
}
