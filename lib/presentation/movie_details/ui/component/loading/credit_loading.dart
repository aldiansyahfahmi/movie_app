import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/shared_libraries/component/loading/shimmer_loading.dart';
import 'package:movie_app/shared_libraries/utils/resources/colors.gen.dart';

class CreditLoading extends StatelessWidget {
  const CreditLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 10,
                width: 50,
                color: ColorName.white,
              ),
              Container(
                height: 10,
                width: 60,
                color: ColorName.white,
              ),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                5,
                (index) => Container(
                  margin: EdgeInsets.only(right: index == 4 ? 0 : 16),
                  width: 100,
                  height: 100,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 10,
                width: 50,
                color: ColorName.white,
              ),
              Container(
                height: 10,
                width: 60,
                color: ColorName.white,
              ),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                5,
                (index) => Container(
                  margin: EdgeInsets.only(right: index == 4 ? 0 : 16),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: ColorName.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
