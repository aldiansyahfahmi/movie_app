import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/domains/movie/domain/entities/response/credits_response_entity.dart';
import 'package:movie_app/shared_libraries/component/card/credits_card.dart';
import 'package:movie_app/shared_libraries/utils/navigation/arguments/credit_argument.dart';
import 'package:movie_app/shared_libraries/utils/navigation/router/movie_details_router.dart';
import 'package:movie_app/shared_libraries/utils/resources/colors.gen.dart';

class Credits extends StatelessWidget {
  const Credits(
      {super.key,
      required this.movideId,
      required this.creditName,
      required this.data});

  final int movideId;
  final String creditName;
  final List<CreditsDataEntity> data;

  @override
  Widget build(BuildContext context) {
    final MovieDetailsRouter movieDetailsRouter = MovieDetailsRouterImpl();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              creditName,
              style: TextStyle(
                color: ColorName.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            GestureDetector(
              onTap: () => movieDetailsRouter.navigateToCreditScreen(
                argument: CreditArgument(
                  creditName: creditName,
                  movieId: movideId,
                ),
              ),
              child: Text(
                'View More',
                style: TextStyle(
                  color: ColorName.orange,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
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
            children: data
                .take(10)
                .map(
                  (cast) => Padding(
                    padding: EdgeInsets.only(
                      right: cast == data.take(10).last ? 0 : 16,
                    ),
                    child: CreditsCard(credit: cast),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
