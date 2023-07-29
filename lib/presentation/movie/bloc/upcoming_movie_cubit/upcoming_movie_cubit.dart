import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domains/movie/domain/usecases/get_upcoming_movie_usecase.dart';
import 'package:movie_app/presentation/movie/bloc/upcoming_movie_cubit/upcoming_movie_state.dart';
import 'package:movie_app/shared_libraries/utils/state/view_data_state.dart';
import 'package:movie_app/shared_libraries/utils/usecase/usecase.dart';

class UpcomingMovieCubit extends Cubit<UpcomingMovieState> {
  final GetUpcomingMovieUseCase getUpcomingMovieUseCase =
      GetUpcomingMovieUseCase();

  UpcomingMovieCubit()
      : super(UpcomingMovieState(upcomingMovieState: ViewData.initial()));

  void getUpcomingMovie() async {
    emit(UpcomingMovieState(upcomingMovieState: ViewData.loading()));
    final result = await getUpcomingMovieUseCase.call(const NoParams());
    result.fold(
      (failure) => emit(
        UpcomingMovieState(
          upcomingMovieState: ViewData.error(
            message: failure.errorMessage,
            failure: failure,
          ),
        ),
      ),
      (result) => emit(
        UpcomingMovieState(
          upcomingMovieState: ViewData.loaded(data: result),
        ),
      ),
    );
  }
}
