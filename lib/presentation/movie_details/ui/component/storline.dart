import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/domains/movie/domain/entities/response/movie_response_entity.dart';
import 'package:movie_app/presentation/movie_details/ui/component/genres.dart';
import 'package:movie_app/shared_libraries/utils/resources/colors.gen.dart';

class Storyline extends StatelessWidget {
  final MovieDataEntity movie;
  const Storyline({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Genres(movie: movie),
          SizedBox(
            height: 16.h,
          ),
          Text(
            'Storyline',
            style: TextStyle(
              color: ColorName.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            movie.overview,
            style: TextStyle(
              color: ColorName.white.withOpacity(0.80),
              fontSize: 14.sp,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
