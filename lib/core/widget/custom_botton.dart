import 'package:flutter/material.dart';
import 'package:lavender/core/themes/app_colors.dart';
import 'package:lavender/core/themes/padding.dart';
import 'package:lavender/core/themes/stylesdart.dart';

class CustomBotton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomBotton({required this.text, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.symHor16Ver24,
      child: SizedBox(
        height: 48,
        width: 343,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 151, 149, 245),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
            ),
          ),
          child: Text(
            text,
            style: TextStyles.bodyMedium.copyWith(
              color: AppColors.primaryColorLavenderTextBouttom,
            ),
          ),
        ),
      ),
    );
  }
}
