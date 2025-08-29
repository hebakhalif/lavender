import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavender/core/routing/router.dart';
import 'package:lavender/core/themes/app_colors.dart';
import 'package:lavender/core/widget/custom_botton.dart';
import 'package:lavender/features/sign_up/presentation/widgets/social_circle_button.dart';
import 'package:lavender/features/sign_up/presentation/widgets/text_fild.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: SingleChildScrollView(
            // physics: const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "الرجوع",
                    style: TextStyle(
                      color: AppColors.purple600.withOpacity(0.8),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 35.h),
                Center(
                  child: Text(
                    "تسجيل الدخول",
                    style: TextStyle(
                      color: AppColors.primaryColorDarkText,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "البريد الإلكتروني",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    CustomTextField(
                      hint: "البريد الإلكتروني",
                      controller: TextEditingController(),
                      keyboardType: TextInputType.emailAddress,
                    ),

                    SizedBox(height: 16.h),
                    Text(
                      "كلمة المرور ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    CustomTextField(
                      hint: "كلمة المرور",
                      controller: TextEditingController(),
                      keyboardType: TextInputType.visiblePassword,
                      isPassword: true,
                    ),
                    SizedBox(height: 30.h),
                    CustomBotton(
                      text: "دخول",
                      onPressed: () {},
                      textColor: AppColors.w,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("ليس لديك حساب ؟"),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.signUpScreen);
                          },
                          child: Text("إنشاء حساب"),
                        ),

                      ],
                    ),
                       Divider(
                         height: 1,
                         indent: 50,
                         endIndent: 50,
                         color: AppColors.grey100,
                       ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialCircleButton(
                          imagePath: 'assets/svg/icons_Facebook.svg',
                          onTap: () {},
                        ),

                        SocialCircleButton(
                          imagePath: 'assets/svg/icons.social_apple.svg',
                          onTap: () {},
                        ),

                        SocialCircleButton(
                          imagePath: 'assets/svg/icons.social_google.svg',
                          onTap: () {},
                        ),

                        SocialCircleButton(
                          imagePath: 'assets/svg/Group (2).svg',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
