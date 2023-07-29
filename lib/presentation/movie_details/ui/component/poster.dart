import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/domains/movie/domain/entities/response/movie_response_entity.dart';
import 'package:movie_app/shared_libraries/component/loading/shimmer_loading.dart';
import 'package:movie_app/shared_libraries/utils/constants/app_constants.dart';
import 'package:movie_app/shared_libraries/utils/extensions/date_extension.dart';
import 'package:movie_app/shared_libraries/utils/extensions/number_extension.dart';
import 'package:movie_app/shared_libraries/utils/resources/assets.gen.dart';
import 'package:movie_app/shared_libraries/utils/resources/colors.gen.dart';

class Poster extends StatelessWidget {
  const Poster({
    super.key,
    required this.movie,
  });

  final MovieDataEntity movie;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 16,
      right: 16,
      child: FractionallySizedBox(
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                height: 170.h,
                width: 125,
                fit: BoxFit.cover,
                imageUrl: AppConstants.appApi.baseUrlImage + movie.posterPath,
                placeholder: (context, url) => ShimmerLoading(
                  child: Container(
                    height: 170.h,
                    width: 125,
                    decoration: BoxDecoration(
                      color: ColorName.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.originalTitle,
                    style: TextStyle(
                      color: ColorName.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    children: [
                      Assets.images.icons.star.svg(width: 14, height: 14),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        movie.voteAverage.toStringAsFixed(1),
                        style: TextStyle(
                          color: ColorName.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        movie.voteCount.toK(),
                        style: TextStyle(
                          color: ColorName.white,
                          fontSize: 12.sp,
                        ),
                      ),
                      Text(
                        ' reviews',
                        style: TextStyle(
                          color: ColorName.white,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    children: [
                      Text(
                        movie.runtime.toTimeFormat(),
                        style: TextStyle(
                          color: ColorName.white,
                          fontSize: 12.sp,
                        ),
                      ),
                      Text(
                        ' • ',
                        style: TextStyle(
                          color: ColorName.white,
                          fontSize: 12.sp,
                        ),
                      ),
                      Text(
                        movie.releaseDate.toDateFormat(),
                        style: TextStyle(
                          color: ColorName.white,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
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
