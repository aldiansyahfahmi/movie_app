import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:movie_app/shared_libraries/component/loading/shimmer_loading.dart';
import 'package:movie_app/shared_libraries/utils/resources/colors.gen.dart';

class CreditsLoading extends StatelessWidget {
  const CreditsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      child: AlignedGridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount:
            MediaQuery.of(context).orientation == Orientation.portrait ? 4 : 8,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        itemCount: 20,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 100.h,
                width: 100,
                decoration: BoxDecoration(
                  color: ColorName.white,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Container(
                width: 70,
                height: 8,
                color: ColorName.white,
              ),
            ],
          );
        },
      ),
    );
  }
}
