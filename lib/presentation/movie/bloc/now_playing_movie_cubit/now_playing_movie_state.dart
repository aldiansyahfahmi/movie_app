import 'package:equatable/equatable.dart';
import 'package:movie_app/domains/movie/domain/entities/response/movie_response_entity.dart';
import 'package:movie_app/shared_libraries/utils/state/view_data_state.dart';

class NowPlayingMovieState extends Equatable {
  final ViewData<List<MovieDataEntity>> nowPlayingMovieState;

  const NowPlayingMovieState({required this.nowPlayingMovieState});

  @override
  List<Object?> get props => [nowPlayingMovieState];
}
