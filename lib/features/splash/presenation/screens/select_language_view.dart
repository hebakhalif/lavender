import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lavender/core/cubits/select_language_cubit.dart';
import 'package:lavender/core/routing/router.dart';
import 'package:lavender/core/themes/app_colors.dart';
import 'package:lavender/core/themes/spacing.dart';
import 'package:lavender/core/themes/styles.dart';
import 'package:lavender/core/widget/custom_botton.dart';
import 'package:lavender/core/widget/select_lang.dart';
import '../../../../l10n/app_localizations.dart';

class SelectLanguageView extends StatelessWidget {
  const SelectLanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/background_app.png",
              fit: BoxFit.cover,
            ),
          ),
          Transform.scale(
            scale: 0.95,
            child: Padding(
              padding: const EdgeInsets.only(top: 45),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      "assets/svg/logo_lavender2.svg",
                      width: 200,
                      height: 160,
                      placeholderBuilder: (_) =>
                      const CircularProgressIndicator(),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "ادخل و شارك مع مجتمع مثلك وقابل\nافضل المتخصصين",
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyles.h6Regular.copyWith(
                        color: AppColors.purple900,
                      ),
                    ),
                    AppSpaces.vSpace40,
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        "اختر اللغة الخاصة بك التي تناسبك",
                        style: TextStyles.h6Regular.copyWith(
                          color: AppColors.primaryColorDarkText,
                        ),
                      ),
                    ),
                    AppSpaces.vSpace24,

                    BlocBuilder<SelectLanguageCubit, String>(
                      builder: (context, selectedLang) {
                        return Column(
                          children: [
                            SelectLang(
                              image: "assets/svg/emojione_flag-for-egypt.svg",
                              text: "العربية",
                              isSlected: selectedLang == "ar",
                              onTap: () {
                                context
                                    .read<SelectLanguageCubit>()
                                    .selectLang("ar");
                              },
                            ),
                            AppSpaces.vSpace16,
                            const Divider(
                              height: 1,
                              indent: 16,
                              endIndent: 1,
                              color: AppColors.grey2,
                            ),
                            AppSpaces.vSpace24,
                            SelectLang(
                              image:
                              "assets/svg/emojione_flag-for-united-kingdom.svg",
                              text: "English",
                              isSlected: selectedLang == "en",                              onTap: () {
                                context
                                    .read<SelectLanguageCubit>()
                                    .selectLang("en");
                              },
                            ),
                            AppSpaces.vSpace16,
                            const Divider(
                              height: 1,
                              indent: 16,
                              endIndent: 1,
                              color: AppColors.grey2,
                            ),
                          ],
                        );
                      },
                    ),

                    AppSpaces.vSpace40,

                    CustomButton(
                      text: AppLocalizations.of(context)?.next ?? "Next",
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          Routes.homeScreen,
                        );
                      },
                    ),
                    AppSpaces.vSpace24,
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
