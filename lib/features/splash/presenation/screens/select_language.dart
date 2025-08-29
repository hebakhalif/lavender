import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lavender/core/routing/router.dart';
import 'package:lavender/core/themes/app_colors.dart';
import 'package:lavender/core/themes/spacing.dart';
import 'package:lavender/core/themes/stylesdart.dart';
import 'package:lavender/core/widget/custom_botton.dart';
import 'package:lavender/core/widget/select_lang.dart';
//import 'package:lavender/features/onbording/presentation/cubit/onbording_cubit.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({super.key});

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  //String selectedLang ="en";
  String? selectedLang;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/background_app.png",
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Transform.scale(
            scale: 0.95,
            child: Padding(
              padding: const EdgeInsets.only(top: 45),
              // child: Directionality(
              //textDirection: TextDirection.rtl,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      "assets/svg/logo_lavender2.svg",
                      width: 200,
                      height: 160,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    textAlign: TextAlign.center,
                    "intro_message".tr(),
                    maxLines: 2,
                    style: TextStyles.h6Regular.copyWith(
                      color: AppColors.purple900,
                    ),
                  ),
                  AppSpaces.vSpace40,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          "select_lang".tr(),
                          style: TextStyles.h6Regular.copyWith(
                            color: AppColors.primaryColorDarkText,
                          ),
                        ),
                      ),
                      AppSpaces.vSpace24,
                      SelectLang(
                        image: "assets/svg/emojione_flag-for-egypt.svg",
                        text: "arabic".tr(),
                        isSlected: selectedLang == "ar",
                        onTap: () {
                          setState(() {
                            selectedLang = "ar";
                          });
                          context.setLocale(const Locale('ar'));
                        },
                      ),
                      AppSpaces.vSpace16,

                      Divider(
                        height: 1,
                        indent: 16,
                        endIndent: 1,
                        color: AppColors.grey2,
                      ),
                      AppSpaces.vSpace24,

                      SelectLang(
                        image:
                            "assets/svg/emojione_flag-for-united-kingdom.svg",
                        text: "english".tr(),
                        isSlected: selectedLang == "en",
                        onTap: () {
                          setState(() {
                            selectedLang = "en";
                          });
                          context.setLocale(const Locale('en'));
                        },
                      ),
                      AppSpaces.vSpace16,

                      Divider(
                        height: 1,
                        indent: 16,
                        endIndent: 1,
                        color: AppColors.grey2,
                      ),
                    ],
                  ),
                  Spacer(),
                  CustomButton(
                    text: "next".tr(),
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        Routes.onboardingScreen,
                      );
                     /* context.read<OnbordingCubit>().completeOnboarding();
                      Navigator.pushReplacementNamed(
                        context,
                        Routes.homeScreen,
                      );*/
                    },
                  ),
                ],
              ),
            ),
          ),

          // ),
        ],
      ),
    );
  }
}
