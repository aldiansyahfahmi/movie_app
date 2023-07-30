import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domains/movie/domain/entities/response/movie_response_entity.dart';
import 'package:movie_app/domains/movie/domain/usecases/get_top_rated_movie_usecase.dart';
import 'package:movie_app/presentation/movie/bloc/top_rated_movie_cubit/top_rated_movie_state.dart';
import 'package:movie_app/shared_libraries/utils/state/view_data_state.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class TopRatedMovieCubit extends Cubit<TopRatedMovieState> {
  final GetTopRatedMovieUseCase getTopRatedMovieUseCase =
      GetTopRatedMovieUseCase();

  TopRatedMovieCubit()
      : super(TopRatedMovieState(topRatedMovieState: ViewData.initial()));

  final PagingController<int, MovieDataEntity> pagingController =
      PagingController(firstPageKey: 1);

  void getTopRatedMovie({required int page}) async {
    emit(TopRatedMovieState(topRatedMovieState: ViewData.loading()));
    final result = await getTopRatedMovieUseCase.call(page);
    result.fold(
      (failure) => emit(
        TopRatedMovieState(
          topRatedMovieState: ViewData.error(
            message: failure.errorMessage,
            failure: failure,
          ),
        ),
      ),
      (result) {
        final isLastPage = result.page == result.totalPages;
        if (result.results.isEmpty) {
          emit(
            TopRatedMovieState(
              topRatedMovieState: ViewData.noData(message: ''),
            ),
          );
        } else {
          emit(
            TopRatedMovieState(
              topRatedMovieState: ViewData.loaded(data: result.results),
            ),
          );
        }
        if (isLastPage) {
          pagingController.appendLastPage(result.results);
        } else {
          pagingController.appendPage(result.results, page + 1);
        }
      },
    );
  }
}
