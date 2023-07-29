import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/shared_libraries/utils/resources/assets.gen.dart';
import 'package:movie_app/shared_libraries/utils/resources/colors.gen.dart';

class Search extends StatelessWidget {
  const Search({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorName.gray,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Search',
            style: TextStyle(
              color: ColorName.white,
              fontSize: 14.sp,
            ),
          ),
          Assets.images.icons.search.svg(),
        ],
      ),
    );
  }
}
