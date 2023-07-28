import 'package:equatable/equatable.dart';
import 'package:movie_app/features/home/domain/entities/response/movie_response_entity.dart';

class MovieDetailsArgument extends Equatable {
  final MovieDataEntity movieDataEntity;

  const MovieDetailsArgument({required this.movieDataEntity});

  @override
  List<Object?> get props => [movieDataEntity];
}
