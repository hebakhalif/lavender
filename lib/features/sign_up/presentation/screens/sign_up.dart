import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavender/core/helpers/show_floating_message.dart';
import 'package:lavender/core/routing/router.dart';
import 'package:lavender/core/themes/app_colors.dart';
import 'package:lavender/core/widget/custom_botton.dart';
import 'package:lavender/core/widget/validators.dart';
import 'package:lavender/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:lavender/features/sign_up/presentation/widgets/social_circle_button.dart';
import 'package:lavender/features/sign_up/presentation/widgets/text_fild.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: SingleChildScrollView(
            child: Transform.scale(
              scale: 0.95,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "الرجوع",
                      style: TextStyle(
                        color: AppColors.purple600.withOpacity(0.8),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Center(
                    child: Text(
                      "إنشاء حساب",
                      style: TextStyle(
                        color: AppColors.primaryColorDarkText,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),

                  BlocConsumer<SignUpCubit, SignUpState>(
                    listener: (context, state) {
                      if (state is SignUpSuccess) {
                        showFloatingMessage(
                          context,
                          "تم التسجيل بنجاح 🎉",
                          background: AppColors.green1,
                          seconds: 2,
                        );

                        Future.delayed(const Duration(milliseconds: 600), () {
                          Navigator.pushReplacementNamed(
                            context,
                            Routes.signInScreen,
                          );
                        });
                      } else if (state is SignUpError) {
                        showFloatingMessage(
                          context,
                          state.message,
                          background: Colors.red,
                          seconds: 2,
                        );
                      }
                    },
                    builder: (context, state) {
                      final cubit = context.read<SignUpCubit>();
                      if (state is SignUpLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return Form(
                        key: formKey,
                        child: Column(
                          spacing: 16.h,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // الاسم
                            Row(
                              spacing: 6.w,
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    hint: "First Name",
                                    title: 'First Name',
                                    controller: cubit.firstNameController,
                                    keyboardType: TextInputType.name,
                                    validator:
                                        (value) =>
                                            Validators.required(value, "الاسم مطلوب"),
                                  ),
                                ),Expanded(
                                  child: CustomTextField(
                                    hint: "Last Name",
                                    title: 'Last Name',
                                    controller: cubit.lastNameController,
                                    keyboardType: TextInputType.name,
                                    validator:
                                        (value) =>
                                            Validators.required(value, "الاسم مطلوب"),
                                  ),
                                ),
                              ],
                            ),
                            CustomTextField(
                              title: 'البريد الإلكتروني',
                              hint: "البريد الإلكتروني",
                              controller: cubit.emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator:
                                  (value) =>
                                      Validators.required(
                                        value,
                                        "الإيميل مطلوب",
                                      ) ??
                                      Validators.email(value),
                            ),
                            SizedBox(height: 16.h),
                            CustomTextField(
                              hint: "كلمة المرور",
                              title: "كلمة المرور",
                              controller: cubit.passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              isPassword: true,
                              validator:
                                  (value) =>
                                      Validators.required(
                                        value,
                                        "كلمة المرور مطلوبة",
                                      ) ??
                                      Validators.minLength(
                                        value,
                                        8,
                                        "على الأقل 8 حروف",
                                      ),
                            ),
                            SizedBox(height: 14.h),

                            CustomButton(
                              text: "دخول",
                              textColor: AppColors.w,
                              onPressed: () {
                                debugPrint("SignUp button pressed");

                                if (!formKey.currentState!.validate()) {
                                  debugPrint("Form is not valid");
                                  return;
                                }

                                final firstName = cubit.firstNameController.text.trim();
                                final lastName = cubit.lastNameController.text.trim();
                                final email = cubit.emailController.text.trim();
                                final password =
                                    cubit.passwordController.text.trim();

                                context.read<SignUpCubit>().signUp(
                                  first_name: firstName,
                                  last_name: lastName,
                                  email: email,
                                  password: password,
                                );
                              },
                            ),

                            SizedBox(height: 4.h),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("لديك حساب بالفعل؟"),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      Routes.signInScreen,
                                    );
                                  },
                                  child: const Text("تسجيل الدخول"),
                                ),
                              ],
                            ),

                            const Divider(
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
                                  imagePath:
                                      'assets/svg/icons.social_apple.svg',
                                  onTap: () {},
                                ),
                                SocialCircleButton(
                                  imagePath:
                                      'assets/svg/icons.social_google.svg',
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
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
