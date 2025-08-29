import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lavender/core/themes/app_colors.dart';

class SocialCircleButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;
  final double size;
  final Color backgroundColor;

  const SocialCircleButton({
    required this.imagePath,
    required this.onTap,
    this.size = 50,
    this.backgroundColor = AppColors.grey3,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0 ,vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(size / 2),
        child: Container(
          height: size,
          width: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor,
          ),
          child: Padding(
            padding: EdgeInsets.all(size * 0.24),
            child: SvgPicture.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
