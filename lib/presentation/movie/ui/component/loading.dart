import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/shared_libraries/component/loading/shimmer_loading.dart';
import 'package:movie_app/shared_libraries/utils/resources/assets.gen.dart';
import 'package:movie_app/shared_libraries/utils/resources/colors.gen.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: index == 4 ? 0 : 16),
            child: ShimmerLoading(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 160.h,
                    width: 140,
                    decoration: BoxDecoration(
                      color: ColorName.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    width: 125,
                    height: 8,
                    color: ColorName.white,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Container(
                    width: 80,
                    height: 8,
                    color: ColorName.white,
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
                      Container(
                        width: 10,
                        height: 8,
                        color: ColorName.white,
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
