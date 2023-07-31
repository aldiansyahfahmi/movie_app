import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/domains/movie/domain/entities/response/movie_response_entity.dart';
import 'package:movie_app/shared_libraries/component/loading/shimmer_loading.dart';
import 'package:movie_app/shared_libraries/utils/navigation/arguments/movie_details_argument.dart';
import 'package:movie_app/shared_libraries/utils/navigation/router/movie_router.dart';
import 'package:movie_app/shared_libraries/utils/resources/colors.gen.dart';

class MoviesBanner extends StatefulWidget {
  final List<MovieDataEntity> data;
  const MoviesBanner({super.key, required this.data});

  @override
  State<MoviesBanner> createState() => _MoviesBannerState();
}

class _MoviesBannerState extends State<MoviesBanner> {
  final MovieRouter movieRouter = MovieRouterImpl();
  int bannerIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                bannerIndex = index;
              });
            },
          ),
          items: widget.data
              .map(
                (movie) => GestureDetector(
                  onTap: () => movieRouter.navigateToMovieDetailsScreen(
                    argument: MovieDetailsArgument(movieDataEntity: movie),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: DecoratedBox(
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
                      child: GridTile(
                        footer: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: ColorName.black.withOpacity(0.50),
                          ),
                          child: Text(
                            movie.originalTitle,
                            style: TextStyle(
                              color: ColorName.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: movie.backdropPath,
                          placeholder: (context, url) => ShimmerLoading(
                            child: Container(
                              decoration: BoxDecoration(
                                color: ColorName.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: widget.data
                .map(
                  (e) => Container(
                    margin: const EdgeInsets.only(right: 4),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: bannerIndex == widget.data.indexOf(e)
                          ? ColorName.white
                          : ColorName.gray,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
