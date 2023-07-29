import 'package:flutter/material.dart';
import 'package:movie_app/domains/movie/domain/entities/response/movie_response_entity.dart';
import 'package:movie_app/shared_libraries/component/card/movie_card.dart';
import 'package:movie_app/shared_libraries/utils/navigation/arguments/movie_details_argument.dart';
import 'package:movie_app/shared_libraries/utils/navigation/router/home_router.dart';

class ListMovie extends StatelessWidget {
  final List<MovieDataEntity> data;
  const ListMovie({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final HomeRouter homeRouter = HomeRouterImpl();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: data
            .map(
              (movie) => Padding(
                padding: EdgeInsets.only(
                  right: movie == data.last ? 0 : 16,
                ),
                child: MovieCard(
                  movie: movie,
                  onTap: () => homeRouter.navigateToMovieDetailsScreen(
                    argument: MovieDetailsArgument(
                      movieDataEntity: movie,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
