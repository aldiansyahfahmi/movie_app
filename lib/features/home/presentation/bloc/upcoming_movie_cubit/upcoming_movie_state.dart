import 'package:equatable/equatable.dart';
import 'package:movie_app/features/home/domain/entities/response/movie_response_entity.dart';
import 'package:movie_app/shared_libraries/utils/state/view_data_state.dart';

class UpcomingMovieState extends Equatable {
  final ViewData<List<MovieDataEntity>> upcomingMovieState;

  const UpcomingMovieState({required this.upcomingMovieState});

  @override
  List<Object?> get props => [upcomingMovieState];
}
