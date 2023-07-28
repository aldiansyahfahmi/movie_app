import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/movie_details/presentation/ui/component/backdrop.dart';
import 'package:movie_app/features/movie_details/presentation/ui/component/poster.dart';
import 'package:movie_app/shared_libraries/utils/navigation/arguments/movie_details_argument.dart';
import 'package:movie_app/shared_libraries/utils/resources/colors.gen.dart';

class MovieDetailsScreen extends StatelessWidget {
  final MovieDetailsArgument arguments;
  const MovieDetailsScreen({super.key, required this.arguments});

  @override
  Widget build(BuildContext context) {
    final movie = arguments.movieDataEntity;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Backdrop(movie: movie),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 45,
                    ),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorName.white.withOpacity(0.20),
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: ColorName.white,
                    ),
                  ),
                ),
                Poster(movie: movie),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
            ),
          ],
        ),
      ),
    );
  }
}
