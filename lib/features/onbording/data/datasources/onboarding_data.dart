import 'package:easy_localization/easy_localization.dart';
import 'package:lavender/core/themes/app_colors.dart';
import 'package:lavender/features/onbording/data/models/onboarding_model.dart';

List<OnboardingModel> onboardingData = [
  OnboardingModel(
    imagePath: 'assets/images/image_onbording1.png',
    title:"titleonboarding1".tr(),
    subtitle:"subtitleonboarding1".tr(),
    progress: 0.3,
     backgroundColor: AppColors.purpleappbar,
  ),
  OnboardingModel(
    imagePath: 'assets/images/image_onbording2.png',
    title: "titleonboarding2".tr(),
    subtitle: "subtitleonboarding2".tr(),
    progress: 0.6,
     backgroundColor: AppColors.grey200,
  ),
  OnboardingModel(
    imagePath: 'assets/images/image_onbording3.png',
    title: "titleonboarding3".tr(),
    subtitle: "subtitleonboarding3".tr(),
    progress: 1.0,
      backgroundColor: AppColors.grey100,
  ),
];