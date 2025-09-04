import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavender/core/networking/api_constants.dart';
import 'package:lavender/core/themes/app_colors.dart';
import 'package:lavender/core/themes/stylesdart.dart';
import 'package:lavender/features/home/data/models/specialist.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key, this.onTap, required this.specialist});
  final void Function()? onTap;
  final Specialist specialist;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // margin: EdgeInsets.all(12.r),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 70.w,
                  width: 70.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage("${ApiConstants.imagePath}${specialist.profilePic}"),
                      fit: BoxFit.cover,
                    ),
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
                              "${specialist.user.firstName} ${specialist.user.lastName}",
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
                          Text(
                            "${specialist.yearsOfExperience} years experience",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            "${specialist.avgRating}",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 2.w),
                          const Icon(Icons.star, size: 14, color: Colors.amber),
                        ],
                      ),

                      SizedBox(height: 6.h),

                      Row(
                        children: [
                          Icon(Icons.circle,
                              size: 10.sp, color: Colors.greenAccent.shade400),
                          SizedBox(width: 4.w),
                          Text("85% attendance",
                              style: TextStyle(fontSize: 12.sp)),
                        ],
                      ),

                      SizedBox(height: 4.h),

                      Row(
                        children: [
                          Icon(Icons.circle,
                              size: 10.sp, color: AppColors.primaryColorLavenderLangAndText),
                          SizedBox(width: 4.w),
                          Text("20 stories recovery",
                              style: TextStyle(fontSize: 12.sp)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 10.h),

            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 12.sp, color: Colors.black87),
                children: [
                  const TextSpan(text: "Earliest appointment: "),
                  TextSpan(
                    text: "October 25 at 5:00 PM",
                    style: TextStyles.smallRegular.copyWith(color: AppColors.primaryColorLavenderLangAndText),
                  ),
                ],
              ),
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
                    icon: const Icon(Icons.event_available, color: Colors.white),
                    label: Text(
                      "Book now",
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
                      "${specialist.pricePerHour} L.E",
                      style: TextStyles.smallRegular.copyWith(
                        color: AppColors.primaryColorLavenderLangAndText,
                        height: 1.2,
                      ),
                    ),
                    Text(
                      "hourly rate",
                      style: TextStyles.smallRegular.copyWith(
                        color: AppColors.grey,
                        height: 1.2,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
