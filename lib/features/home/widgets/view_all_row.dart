import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavender/core/themes/app_colors.dart';
import 'package:lavender/core/themes/stylesdart.dart';
import '../../../../l10n/app_localizations.dart';

class ViewAllRow extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const ViewAllRow({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyles.bodyMedium.copyWith(color: AppColors.primaryColorLavenderLangAndText)),
          GestureDetector(
            onTap: onTap,
            child: Text(
              AppLocalizations.of(context)?.view_all ?? "View All",
              style: TextStyles.smallMedium.copyWith(
                color: AppColors.primaryColorLavenderLangAndText,
                decoration: TextDecoration.underline
              ),
            ),
          ),
        ],
      ),
    );
  }
}
