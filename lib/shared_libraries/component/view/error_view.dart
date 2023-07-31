import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/shared_libraries/utils/resources/colors.gen.dart';

class ErrorView extends StatelessWidget {
  final String error;
  final GestureTapCallback onTap;
  const ErrorView({super.key, required this.error, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              error == 'null' ? 'Terjadi kesalahan, coba lagi' : error,
              style: TextStyle(
                color: ColorName.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 8.h,
            ),
            TextButton(
              onPressed: onTap,
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(ColorName.gray),
                overlayColor: MaterialStatePropertyAll(Colors.transparent),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.refresh,
                    color: ColorName.white,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    'Refresh',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: ColorName.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
