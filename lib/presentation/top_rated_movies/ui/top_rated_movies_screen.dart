import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movie_app/domains/movie/domain/entities/response/movie_response_entity.dart';
import 'package:movie_app/presentation/movie/bloc/top_rated_movie_cubit/top_rated_movie_cubit.dart';
import 'package:movie_app/shared_libraries/component/button/custom_back_button.dart';
import 'package:movie_app/shared_libraries/component/card/movie_card.dart';
import 'package:movie_app/shared_libraries/component/loading/movie_loading.dart';
import 'package:movie_app/shared_libraries/component/view/error_view.dart';
import 'package:movie_app/shared_libraries/utils/resources/colors.gen.dart';

class TopRatedMoviesScreen extends StatefulWidget {
  const TopRatedMoviesScreen({super.key});

  @override
  State<TopRatedMoviesScreen> createState() => _TopRatedMoviesScreenState();
}

class _TopRatedMoviesScreenState extends State<TopRatedMoviesScreen> {
  void getTopRatedMovies() {
    context.read<TopRatedMovieCubit>().pagingController.addPageRequestListener(
          (pageKey) => context
              .read<TopRatedMovieCubit>()
              .getTopRatedMovie(page: pageKey),
        );
  }

  @override
  void initState() {
    getTopRatedMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final topRatedMovieCubit = context.read<TopRatedMovieCubit>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const CustomBackButton(),
                  const SizedBox(
                    width: 24,
                  ),
                  Text(
                    'Top Rated Movies',
                    style: TextStyle(
                      color: ColorName.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PagedGridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 100 / 250,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  crossAxisCount: 3,
                ),
                pagingController: topRatedMovieCubit.pagingController,
                builderDelegate: PagedChildBuilderDelegate<MovieDataEntity>(
                  firstPageProgressIndicatorBuilder: (_) =>
                      _buildLoading(context),
                  newPageProgressIndicatorBuilder: (_) => const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: CircularProgressIndicator(),
                  ),
                  firstPageErrorIndicatorBuilder: (_) => ErrorView(
                    error: topRatedMovieCubit.pagingController.error,
                    onTap: () => topRatedMovieCubit.pagingController.refresh(),
                  ),
                  noItemsFoundIndicatorBuilder: (_) => const SizedBox(),
                  itemBuilder: (_, item, index) {
                    return MovieCard(
                      movie: item,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoading(BuildContext context) {
    return AlignedGridView.count(
      crossAxisCount:
          MediaQuery.of(context).orientation == Orientation.portrait ? 3 : 7,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      itemCount: 12,
      itemBuilder: (context, index) {
        return const MovieLoading();
      },
    );
  }
}
