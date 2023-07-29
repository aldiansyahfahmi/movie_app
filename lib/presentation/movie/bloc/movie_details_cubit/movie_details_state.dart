import 'package:equatable/equatable.dart';
import 'package:movie_app/domains/movie/domain/entities/response/movie_response_entity.dart';
import '/shared_libraries/utils/state/view_data_state.dart';

class MovieDetailsState extends Equatable {
  final ViewData<MovieDataEntity> movieDetailsState;

  const MovieDetailsState({required this.movieDetailsState});

  @override
  List<Object?> get props => [movieDetailsState];
}
