import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/shared_libraries/component/loading/shimmer_loading.dart';
import 'package:movie_app/shared_libraries/utils/resources/colors.gen.dart';

class DetailLoading extends StatelessWidget {
  const DetailLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 350.h,
            width: double.infinity,
            color: ColorName.white,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      3,
                      (index) => Container(
                        margin: EdgeInsets.only(
                          right: index == 2 ? 0 : 8,
                        ),
                        height: 25,
                        width: 80,
                        decoration: BoxDecoration(
                          color: ColorName.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  height: 10,
                  width: 90,
                  color: ColorName.white,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Column(
                  children: List.generate(
                    7,
                    (index) => Container(
                      margin: const EdgeInsets.only(bottom: 4),
                      height: 8,
                      width: double.infinity,
                      color: ColorName.white,
                    ),
                  ),
                ),
                Container(
                  height: 8,
                  width: MediaQuery.of(context).size.width / 2,
                  color: ColorName.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
