import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavender/core/routing/router.dart';
import 'package:lavender/core/themes/app_colors.dart';
import 'package:lavender/features/home/widgets/doctor_card.dart';

class AllDoctorsScreen extends StatelessWidget {
  const AllDoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.w,
        title: Text("الاخصائيين"),
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.purple500),
      ),

      body: Padding(
        padding: const EdgeInsets.only(left: 10, top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
                ListView.separated(
                    itemCount: 5,
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    separatorBuilder:
                        (context, index) => SizedBox(height: 12.h),
                    itemBuilder: (context, index) {
                      return DoctorCard(
                        imagePath: "assets/images/image 262.png",
                        namedoctor: "د.لايان محمد",
                        experience: "7 سنين خبرة",
                        priceHour: "200 L.E",
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.psychologistDetailsPage,
                          );
                        },
                      );
                    },
                  ),
            ],
          )
        ),
      ),
    );
  }
}