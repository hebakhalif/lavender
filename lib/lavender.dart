// this is file material app
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavender/core/routing/app_router.dart';
import 'package:lavender/core/routing/router.dart';
class Lavender extends StatelessWidget {
  const Lavender({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(374, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          locale: const Locale("ar"),
          supportedLocales: const [Locale("ar"), Locale("en")],
          initialRoute: Routes.splashTimerScreen,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRouter.generateRoute, 
        );
      },
    );
  }
}
