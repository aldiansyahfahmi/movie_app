import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/shared_libraries/component/button/custom_back_button.dart';
import 'package:movie_app/shared_libraries/utils/resources/colors.gen.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.color,
  });

  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: color ?? ColorName.black,
      child: SafeArea(
        bottom: false,
        left: false,
        child: Row(
          children: [
            const CustomBackButton(),
            const SizedBox(
              width: 24,
            ),
            Text(
              title,
              style: TextStyle(
                color: ColorName.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
