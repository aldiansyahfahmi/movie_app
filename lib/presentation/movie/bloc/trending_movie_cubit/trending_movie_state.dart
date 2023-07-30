import 'package:equatable/equatable.dart';
import 'package:movie_app/domains/movie/domain/entities/response/movie_response_entity.dart';
import '/shared_libraries/utils/state/view_data_state.dart';

class TrendingMovieState extends Equatable {
  final ViewData<List<MovieDataEntity>> trendingMovieState;

  const TrendingMovieState({required this.trendingMovieState});

  @override
  List<Object?> get props => [trendingMovieState];
}
