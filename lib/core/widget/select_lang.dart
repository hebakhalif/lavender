import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lavender/core/themes/app_colors.dart';
import 'package:lavender/core/themes/padding.dart';
import 'package:lavender/core/themes/stylesdart.dart';

class SelectLang extends StatelessWidget {
  final String image;
  final String text;
  final bool isSlected;
  final VoidCallback onTap;
  const SelectLang({
    super.key,
    required this.image,
    required this.text,
    required this.isSlected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: AppPadding.all8,
        child: Row(
          children: [
            SvgPicture.asset(image, width: 32.w, height: 32.h),
            
            Text(
              text,
              style: TextStyles.bodyRegular.copyWith(
                color: isSlected ? AppColors.purple600 : Colors.black,
              ),
            ),
            Spacer(),
            if (isSlected)
            Container(
             width: 24.w,
             height: 24.h,
             decoration: BoxDecoration(
              color: Color.fromARGB(255, 151, 149, 245),
              shape: BoxShape.circle
             ),
            child: 
            
              Icon(Icons.check, color: AppColors.w, size: 18.sp),
            )
            else 
            SizedBox(width: 24.w,),
        
          ],
        ),
      ),
    );
  }
}
