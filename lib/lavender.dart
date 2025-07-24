import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavender/core/routing/app_router.dart';
import 'package:lavender/core/routing/router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lavender/l10n/app_localizations.dart';

import 'core/cubits/select_language_cubit.dart';

class Lavender extends StatelessWidget {
  const Lavender({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(374, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return BlocProvider<SelectLanguageCubit>(
          create: (_) => SelectLanguageCubit(),
          child: BlocBuilder<SelectLanguageCubit, String>(
              builder: (context, selectedLang) {
                return MaterialApp(
                locale: Locale(selectedLang),
                supportedLocales: const [
                  Locale('en'),
                  Locale('ar'),
                ],
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                onGenerateRoute: appRouter.generateRoute,
                initialRoute: Routes.splashTimerScreen,
                debugShowCheckedModeBanner: false,
              );
            }
          ),
        );
      },
    );
  }
}
