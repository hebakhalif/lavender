// this is file material app
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:lavender/core/routing/app_router.dart';
import 'package:lavender/core/routing/router.dart';
import 'package:lavender/features/onbording/presentation/cubit/onbording_cubit.dart';
import 'package:lavender/features/splash/presenation/cubit/splash_cubit.dart';
class Lavender extends StatelessWidget {

  const Lavender({super.key, required this.appRouter, required this.box});
  final AppRouter appRouter;
  final Box box;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(374, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SplashCubit()),
        BlocProvider(
          create: (_) => OnbordingCubit(box) // this inject for cuibt 
            ..checkIfOnboardingCompleted(),
        ),
      ],
          child: MaterialApp(
           locale: context.locale,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            initialRoute: Routes.splashTimerScreen,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: appRouter.generateRoute, 
          ),
        );
      },
    );
  }
}
