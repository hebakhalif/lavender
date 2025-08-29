import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lavender/core/networking/dio_helper.dart';
import 'package:lavender/core/routing/app_router.dart';
import 'package:lavender/lavender.dart';

void main() async {
   DioHelper.init();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  final box = await Hive.openBox('settings');
//  bool seen = box.get('onboarding_seen', defaultValue: false);
  await Hive.openBox('onboardingBox');
  await Hive.openBox('userBox');
   
  final AppRouter appRouter = AppRouter();
  runApp(
     EasyLocalization(
        supportedLocales: [Locale('ar'), Locale('en')],
        path: 'assets/lang', 
        fallbackLocale: Locale('ar'),
        startLocale: Locale('ar'),
        child: Lavender(appRouter: appRouter, box: box),
      ),
  );
}