import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/domains/movie/domain/entities/response/video_response_entity.dart';
import 'package:movie_app/shared_libraries/component/loading/shimmer_loading.dart';
import 'package:movie_app/shared_libraries/utils/resources/colors.gen.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({
    super.key,
    required this.video,
    required this.onTap,
  });

  final VideoDataEntity video;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 220,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                height: 150,
                width: 220,
                fit: BoxFit.cover,
                imageUrl: 'https://img.youtube.com/vi/${video.key}/0.jpg',
                placeholder: (context, url) => ShimmerLoading(
                  child: Container(
                    height: 100.h,
                    width: 200,
                    decoration: BoxDecoration(
                      color: ColorName.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: ColorName.white,
                  size: 80,
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              video.name,
              style: TextStyle(
                color: ColorName.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
