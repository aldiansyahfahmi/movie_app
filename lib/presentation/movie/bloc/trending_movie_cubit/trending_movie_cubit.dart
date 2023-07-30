import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domains/movie/domain/usecases/get_trending_movie_usecase.dart';
import '/shared_libraries/utils/state/view_data_state.dart';
import 'trending_movie_state.dart';

class TrendingMovieCubit extends Cubit<TrendingMovieState> {
  final GetTrendingMovieUseCase getTrendingMovieUseCase =
      GetTrendingMovieUseCase();

  TrendingMovieCubit()
      : super(TrendingMovieState(trendingMovieState: ViewData.initial()));

  void getTrendingMovie({required String timeWindow}) async {
    emit(TrendingMovieState(trendingMovieState: ViewData.loading()));
    final result = await getTrendingMovieUseCase.call(timeWindow);
    result.fold(
      (failure) => emit(
        TrendingMovieState(
          trendingMovieState: ViewData.error(
            message: failure.errorMessage,
            failure: failure,
          ),
        ),
      ),
      (result) => emit(
        TrendingMovieState(
          trendingMovieState: ViewData.loaded(
            data: result,
          ),
        ),
      ),
    );
  }
}
