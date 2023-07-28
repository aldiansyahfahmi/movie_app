import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/home/domain/entities/response/movie_response_entity.dart';
import 'package:movie_app/shared_libraries/component/card/movie_card.dart';

class ListMovie extends StatelessWidget {
  final List<MovieDataEntity> data;
  const ListMovie({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260.h,
      child: ListView.builder(
        itemCount: data.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final movie = data[index];
          return Padding(
            padding: EdgeInsets.only(
              right: movie == data.last ? 0 : 16,
            ),
            child: MovieCard(
              movie: movie,
            ),
          );
        },
      ),
    );
  }
}
