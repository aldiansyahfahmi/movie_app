import 'package:movie_app/features/home/domain/usecases/get_popular_movie_usecase.dart';
import 'package:movie_app/features/home/presentation/bloc/popular_movie_cubit/popular_movie_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/shared_libraries/utils/state/view_data_state.dart';
import 'package:movie_app/shared_libraries/utils/usecase/usecase.dart';

class PopularMovieCubit extends Cubit<PopularMovieState> {
  final GetPopularMovieUseCase getPopularMovieUseCase =
      GetPopularMovieUseCase();

  PopularMovieCubit()
      : super(PopularMovieState(popularMovieState: ViewData.initial()));

  void getPopularMovie() async {
    emit(PopularMovieState(popularMovieState: ViewData.loading()));
    final result = await getPopularMovieUseCase.call(const NoParams());
    result.fold(
      (failure) => emit(
        PopularMovieState(
          popularMovieState: ViewData.error(
            message: failure.errorMessage,
            failure: failure,
          ),
        ),
      ),
      (result) => emit(
        PopularMovieState(
          popularMovieState: ViewData.loaded(data: result),
        ),
      ),
    );
  }
}
