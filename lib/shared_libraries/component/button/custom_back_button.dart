import 'package:flutter/material.dart';
import 'package:movie_app/shared_libraries/utils/resources/colors.gen.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorName.white.withOpacity(0.20),
        ),
        child: const Icon(
          Icons.arrow_back,
          color: ColorName.white,
        ),
      ),
    );
  }
}
