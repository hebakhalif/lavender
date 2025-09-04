import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lavender/core/themes/app_colors.dart';
import 'package:lavender/core/themes/styles.dart';
import 'package:lavender/features/home/widgets/dots_indicator.dart';
import 'package:lavender/features/home/widgets/specialists.dart';
import '../../../core/routing/router.dart';
import '../widgets/doctor_card.dart';
import '../widgets/view_all_row.dart';
import '../../../../l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 204,
                decoration: BoxDecoration(
                  color: AppColors.inActiveDateColor,
                  // gradient: AppColors.linearGradient,
                  borderRadius: BorderRadiusDirectional.only(
                    bottomStart: Radius.circular(32),
                    bottomEnd: Radius.circular(32),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 190, top: 90),
                  child: SvgPicture.asset("assets/svg/Meditation Icon.svg"),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 60,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: const Color.fromARGB(142, 190, 151, 196),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(
                          "assets/images/Ellipse 1188.png",
                        ),
                      ),
                    ),

                    SizedBox(width: 10),
                    Column(
                      children: [
                        Text(
                          "صباح الخير",
                          style: TextStyle(color: AppColors.doctorCardColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                          ),
                        ),
                        Text("محمد حسن", style: TextStyles.h6Bold),
                      ],
                    ),
                    Spacer(),
                    Image.asset("assets/images/Frame 1597881901.png"),
                    SizedBox(width: 10),
                    Image.asset("assets/images/Frame 1597881900.png"),
                  ],
                ),
              ),

              Positioned(
                bottom: 15,
                right: 13,
                left: 13,
                child: Material(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.transparent,

                  child: Container(
                    child: CupertinoSearchTextField(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.doctorCardColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      placeholder: "ابحث عن استشاري..".tr(),
                      placeholderStyle: TextStyle(
                        color: AppColors.grey4,
                      ),
                      prefixIcon: Icon(
                        Icons.search_outlined,
                        size: 25,
                        color: AppColors.doctorCardColor,
                      ),
                      //   suffixIcon: Icon(Icons.search_outlined,
                      // size: 25,
                      //  color: AppColors.doctorCardColor,
                      //   )
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 25.h),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 146.h,
                    width: 343.w,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 243, 243, 248),
                      borderRadius: BorderRadius.circular(15),
                    ),

                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                "احصل علي دعم كامل لرحلتك في\n الباقة السنوية",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.purple300,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "اشترك الان",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryColorDarkText,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.arrow_forward_rounded),
                                  ),
                                ],
                              ),

                              DotsIndicator(itemCount: 3, currentIndex: 1),
                            ],
                          ),
                        ),
                        Spacer(),
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                          ),
                          child: Image.asset(
                            "assets/images/Frame 1597881905.png",
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),

                  ViewAllRow(
                    title:
                        AppLocalizations.of(context)?.start_your_journey ??
                        "ابدأ رحلتك",
                    onTap: () {
                      Navigator.pushNamed(context, Routes.specialistScreen);
                    },
                  ),

                  Wrap(
                    spacing: 12.w,
                    runSpacing: 12.h,
                    children: [
                      SpecialistCard(
                        text: "اخصائي نفسي",
                        imagePath: "assets/images/Frame1_of_specialists.png",
                      ),
                      SpecialistCard(
                        text: "اخصائي تربوي للاطفال",
                        imagePath: "assets/images/Frame2_of_specialists.png",
                      ),
                      SpecialistCard(
                        text: "اخصائي مشاكل اسرية",
                        imagePath: "assets/images/Frame3_of_specialists.png",
                      ),
                      SpecialistCard(
                        text: "مشورة سرية",
                        imagePath: "assets/images/Frame4_of_specialists.png",
                      ),
                      SpecialistCard(
                        text: "اخصائي ADHD",
                        imagePath: "assets/images/Frame5_of_specialists.png",
                      ),
                      SpecialistCard(
                        text: "اخصائي التوحد",
                        imagePath: "assets/images/Frame6_of_specialists.png",
                      ),
                    ],
                  ),

                  ViewAllRow(
                    title:
                        AppLocalizations.of(context)?.start_your_journey ??
                        "افضل الاخصائيين",
                    onTap: () {
                        Navigator.pushNamed(
                            context,
                            Routes.allDoctorsScreen,
                          );
                    },
                  ),

                  ListView.separated(
                    itemCount: 2,
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
