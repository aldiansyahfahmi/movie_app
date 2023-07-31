import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/domains/movie/domain/entities/response/movie_response_entity.dart';
import 'package:movie_app/shared_libraries/component/loading/shimmer_loading.dart';
import 'package:movie_app/shared_libraries/utils/resources/colors.gen.dart';

class Backdrop extends StatelessWidget {
  const Backdrop({
    super.key,
    required this.movie,
  });

  final MovieDataEntity movie;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      position: DecorationPosition.foreground,
      decoration: BoxDecoration(
        color: ColorName.black,
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            ColorName.black,
            ColorName.black.withOpacity(0.12),
          ],
        ),
      ),
      child: CachedNetworkImage(
        width: double.infinity,
        height: 350.h,
        fit: BoxFit.cover,
        imageUrl: movie.backdropPath,
        placeholder: (context, url) => ShimmerLoading(
          child: Container(
            width: double.infinity,
            height: 350.h,
            decoration: BoxDecoration(
              color: ColorName.white,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
