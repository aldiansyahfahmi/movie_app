import 'package:flutter/material.dart';
import 'package:movie_app/domains/movie/domain/entities/response/movie_response_entity.dart';
import 'package:movie_app/shared_libraries/utils/resources/colors.gen.dart';

class Genres extends StatelessWidget {
  const Genres({
    super.key,
    required this.movie,
  });

  final MovieDataEntity movie;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: movie.genres
            .map(
              (genre) => Container(
                margin: EdgeInsets.only(
                  right: genre == movie.genres.last ? 0 : 8,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: ColorName.gray,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  genre.name,
                  style: const TextStyle(
                    color: ColorName.white,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
