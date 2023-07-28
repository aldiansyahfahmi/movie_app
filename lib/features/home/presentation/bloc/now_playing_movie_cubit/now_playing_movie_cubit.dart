import 'package:movie_app/features/home/domain/usecases/get_now_playing_movie_usecase.dart';
import 'package:movie_app/features/home/presentation/bloc/now_playing_movie_cubit/now_playing_movie_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/shared_libraries/utils/state/view_data_state.dart';
import 'package:movie_app/shared_libraries/utils/usecase/usecase.dart';

class NowPlayingMovieCubit extends Cubit<NowPlayingMovieState> {
  final GetNowPlayingMovieUseCase getNowPlayingMovieUseCase =
      GetNowPlayingMovieUseCase();

  NowPlayingMovieCubit()
      : super(NowPlayingMovieState(nowPlayingMovieState: ViewData.initial()));

  void getNowPlayingMovie() async {
    emit(NowPlayingMovieState(nowPlayingMovieState: ViewData.loading()));
    final result = await getNowPlayingMovieUseCase.call(const NoParams());
    result.fold(
      (failure) => emit(
        NowPlayingMovieState(
          nowPlayingMovieState: ViewData.error(
            message: failure.errorMessage,
            failure: failure,
          ),
        ),
      ),
      (result) => emit(
        NowPlayingMovieState(
          nowPlayingMovieState: ViewData.loaded(data: result),
        ),
      ),
    );
  }
}
