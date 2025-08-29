/*import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavender/core/themes/app_colors.dart';
import 'package:lavender/features/onbording/presentation/widgets/circular_progress_indicator.dart';
import 'package:lavender/features/onbording/presentation/widgets/top_curve_.dart';

class OnbpordingScreen extends StatefulWidget {
  const OnbpordingScreen({super.key});

  @override
  State<OnbpordingScreen> createState() => _OnbpordingScreenState();
}

class _OnbpordingScreenState extends State<OnbpordingScreen> {
  PageController pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.purpleappbar,

      body: Stack(
        children: [
          Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: Image.asset(
              "assets/images/image_onbording1.png",
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.6,
              fit: BoxFit.cover,
            ),
          ),
     
          Positioned(
            top: 40,
            right: 16,
            child: GestureDetector(
              onTap: () {},
              child: Text(
                "تخطي",
                style: TextStyle(
                  color: AppColors.purple600,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: TopCurveClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.43,
                width: double.infinity,
                color: AppColors.w,

                child: Column(
                  
                 // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 50.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) {
                        return Container(
                          margin: EdgeInsets.all(8),
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                currentPage == index
                                    ? Colors.blueGrey
                                    : Colors.grey,
                          ),
                        );
                      }),
                    ),
                    Text(
                      "في لافندر هيتم تشخيص \nالمشكلة مع متخصصين",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 111, 109, 202),
                        fontSize: 22,

                      ),

                    ),
                    Text(
                      " معتمدين",
                      style: TextStyle(
                        color: AppColors.purple900,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(height: 40.h,),
                     CircularProgressIndicatorWidget(
                       progress: 0.3,
                       onNext: () {
                       },
                     )
                                      ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavender/core/routing/router.dart';
import 'package:lavender/features/onbording/data/datasources/onboarding_data.dart';
import 'package:lavender/features/onbording/presentation/cubit/onbording_cubit.dart';
import 'package:lavender/features/onbording/presentation/widgets/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController pageController = PageController();
  int currentPage = 0;

  void goToNextPage() {
    if (currentPage < onboardingData.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      context.read<OnbordingCubit>().completeOnboarding();
      Navigator.pushReplacementNamed(context, Routes.loginOrSignupScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      physics: NeverScrollableScrollPhysics(),
      itemCount: onboardingData.length,
      onPageChanged: (index) {
        setState(() {
          currentPage = index;
        });
      },
      itemBuilder: (context, index) {
        return OnboardingPage(
          model: onboardingData[index],
          currentPage: currentPage,
          onNext: goToNextPage,
        );
    },
);
}
}