import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:movie_app/shared_libraries/component/button/custom_back_button.dart';
import 'package:movie_app/shared_libraries/component/card/credits_card.dart';
import 'package:movie_app/shared_libraries/utils/navigation/arguments/credit_argument.dart';
import 'package:movie_app/shared_libraries/utils/resources/colors.gen.dart';

class CreditScreen extends StatelessWidget {
  final CreditArgument argument;
  const CreditScreen({super.key, required this.argument});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const CustomBackButton(),
                  const SizedBox(
                    width: 24,
                  ),
                  Text(
                    argument.creditName,
                    style: TextStyle(
                      color: ColorName.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: AlignedGridView.count(
                crossAxisCount: 4,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                itemCount: argument.creditsDataEntity.length,
                itemBuilder: (context, index) {
                  return CreditsCard(
                    credit: argument.creditsDataEntity[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
