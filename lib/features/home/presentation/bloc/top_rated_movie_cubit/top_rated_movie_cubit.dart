import 'package:movie_app/features/home/domain/usecases/get_top_rated_movie_usecase.dart';
import 'package:movie_app/features/home/presentation/bloc/top_rated_movie_cubit/top_rated_movie_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/shared_libraries/utils/state/view_data_state.dart';
import 'package:movie_app/shared_libraries/utils/usecase/usecase.dart';

class TopRatedMovieCubit extends Cubit<TopRatedMovieState> {
  final GetTopRatedMovieUseCase getTopRatedMovieUseCase =
      GetTopRatedMovieUseCase();

  TopRatedMovieCubit()
      : super(TopRatedMovieState(topRatedMovieState: ViewData.initial()));

  void getTopRatedMovie() async {
    emit(TopRatedMovieState(topRatedMovieState: ViewData.loading()));
    final result = await getTopRatedMovieUseCase.call(const NoParams());
    result.fold(
      (failure) => emit(
        TopRatedMovieState(
          topRatedMovieState: ViewData.error(
            message: failure.errorMessage,
            failure: failure,
          ),
        ),
      ),
      (result) => emit(
        TopRatedMovieState(
          topRatedMovieState: ViewData.loaded(data: result),
        ),
      ),
    );
  }
}
