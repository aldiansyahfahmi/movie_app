import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domains/movie/domain/usecases/get_movie_details_usecase.dart';
import '/shared_libraries/utils/state/view_data_state.dart';
import 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase =
      GetMovieDetailsUseCase();

  MovieDetailsCubit()
      : super(MovieDetailsState(movieDetailsState: ViewData.initial()));

  void getMovieDetails({required int id}) async {
    emit(MovieDetailsState(movieDetailsState: ViewData.loading()));
    final result = await getMovieDetailsUseCase.call(id);
    result.fold(
      (failure) => emit(
        MovieDetailsState(
          movieDetailsState: ViewData.error(
            message: failure.errorMessage,
            failure: failure,
          ),
        ),
      ),
      (result) => emit(
        MovieDetailsState(
          movieDetailsState: ViewData.loaded(
            data: result,
          ),
        ),
      ),
    );
  }
}
