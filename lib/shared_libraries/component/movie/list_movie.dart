import 'package:flutter/material.dart';
import 'package:movie_app/domains/movie/domain/entities/response/movie_response_entity.dart';
import 'package:movie_app/shared_libraries/component/card/movie_card.dart';

class ListMovie extends StatelessWidget {
  final List<MovieDataEntity> data;
  const ListMovie({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
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
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
