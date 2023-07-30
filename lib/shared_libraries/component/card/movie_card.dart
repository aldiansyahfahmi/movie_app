import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/domains/movie/domain/entities/response/movie_response_entity.dart';
import 'package:movie_app/shared_libraries/component/loading/shimmer_loading.dart';
import 'package:movie_app/shared_libraries/utils/constants/app_constants.dart';
import 'package:movie_app/shared_libraries/utils/navigation/arguments/movie_details_argument.dart';
import 'package:movie_app/shared_libraries/utils/navigation/router/movie_router.dart';
import 'package:movie_app/shared_libraries/utils/resources/assets.gen.dart';
import 'package:movie_app/shared_libraries/utils/resources/colors.gen.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie,
  });

  final MovieDataEntity movie;

  @override
  Widget build(BuildContext context) {
    final MovieRouter movieRouter = MovieRouterImpl();
    return GestureDetector(
      onTap: () => movieRouter.navigateToMovieDetailsScreen(
        argument: MovieDetailsArgument(
          movieDataEntity: movie,
        ),
      ),
      child: SizedBox(
        width: 140,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                height: 160.h,
                width: 140,
                fit: BoxFit.cover,
                imageUrl: AppConstants.appApi.baseUrlImage + movie.posterPath,
                placeholder: (context, url) => ShimmerLoading(
                  child: Container(
                    height: 160.h,
                    width: 140,
                    decoration: BoxDecoration(
                      color: ColorName.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              movie.originalTitle,
              style: TextStyle(
                color: ColorName.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 4.h,
            ),
            Row(
              children: [
                Assets.images.icons.star.svg(),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  movie.voteAverage.toStringAsFixed(1),
                  style: TextStyle(
                    color: ColorName.white,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
