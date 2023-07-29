import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/domains/movie/domain/entities/response/credits_response_entity.dart';
import 'package:movie_app/shared_libraries/component/loading/shimmer_loading.dart';
import 'package:movie_app/shared_libraries/utils/constants/app_constants.dart';
import 'package:movie_app/shared_libraries/utils/resources/colors.gen.dart';

class CreditsCard extends StatelessWidget {
  const CreditsCard({super.key, required this.cast});

  final CreditsDataEntity cast;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              height: 100.h,
              width: 100,
              fit: BoxFit.cover,
              imageUrl: AppConstants.appApi.baseUrlImage + cast.profilePath,
              placeholder: (context, url) => ShimmerLoading(
                child: Container(
                  height: 150.h,
                  width: 100,
                  decoration: BoxDecoration(
                    color: ColorName.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              errorWidget: (context, url, error) => const Icon(
                Icons.person,
                color: ColorName.white,
                size: 100,
              ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            cast.originalName,
            style: TextStyle(
              color: ColorName.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
