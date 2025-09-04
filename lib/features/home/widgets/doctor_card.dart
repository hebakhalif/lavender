import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavender/core/themes/app_colors.dart';
import 'package:lavender/core/themes/styles.dart';

class DoctorCard extends StatelessWidget {
  final String imagePath;
  final String namedoctor;
  final String experience;
  final String priceHour;

  const DoctorCard({
    super.key,
    this.onTap,
    required this.imagePath,
    required this.namedoctor,
    required this.experience,
    required this.priceHour,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(12.r),
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: AppColors.doctorCardColor,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.asset(
                      imagePath,
                      width: 70.w,
                      height: 70.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 12.w),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                namedoctor,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Icon(
                              Icons.favorite_border,
                              size: 22.sp,
                              color: Colors.grey,
                            ),
                          ],
                        ),

                        SizedBox(height: 4.h),

                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              size: 14,
                              color: Colors.amber,
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              "4.9",
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              experience,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(width: 2.w),
                          ],
                        ),

                        SizedBox(height: 6.h),
                        Row(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 10.sp,
                                  color:
                                      AppColors.primaryColorLavenderLangAndText,
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  "20 قصة تعافي",
                                  style: TextStyle(fontSize: 12.sp),
                                ),
                              ],
                            ),

                            SizedBox(width: 12.w),

                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 10.sp,
                                  color: Colors.greenAccent.shade400,
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  "85% حضور",
                                  style: TextStyle(fontSize: 12.sp),
                                ),
                              ],
                            ),
                          ],
                        ),

                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            children: [
                              TextSpan(
                                text: "اقرب موعد : ",
                                style: TextStyle(color: Colors.black54),
                              ),
                              TextSpan(
                                text: "يوم ",
                                style: TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: "25-10  ",
                                style: TextStyle(color: AppColors.button),
                              ),
                              TextSpan(
                                text: "الساعه ",
                                style: TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: "5:00 م",
                                style: TextStyle(color: AppColors.button),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12.h),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurpleAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                      ),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.event_available,
                        color: Colors.white,
                      ),
                      label: Text(
                        "احجز الان",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        priceHour,
                        style: TextStyles.smallRegular.copyWith(
                          color: AppColors.primaryColorLavenderLangAndText,
                          height: 1.2,
                        ),
                      ),
                      Text(
                        "سعر الساعة",
                        style: TextStyles.smallRegular.copyWith(
                          color: AppColors.grey,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
