import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/domains/movie/domain/entities/response/credits_response_entity.dart';
import 'package:movie_app/shared_libraries/component/card/credits_card.dart';
import 'package:movie_app/shared_libraries/utils/resources/colors.gen.dart';

class Cast extends StatelessWidget {
  const Cast({
    super.key,
    required this.data,
  });

  final CreditsEntity data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Cast',
              style: TextStyle(
                color: ColorName.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'View More',
              style: TextStyle(
                color: ColorName.orange,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: data.cast
                .take(10)
                .map(
                  (cast) => Padding(
                    padding: EdgeInsets.only(
                      right: cast == data.cast.take(10).last ? 0 : 16,
                    ),
                    child: CreditsCard(cast: cast),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
