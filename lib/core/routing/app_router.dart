import 'package:flutter/material.dart';
import 'package:lavender/core/routing/router.dart';
import 'package:lavender/features/home/home_screen.dart';
import 'package:lavender/features/splash/presenation/screens/select_language_view.dart';
import 'package:lavender/features/splash/presenation/screens/splash_timer_screen.dart';


class AppRouter {
   Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashTimerScreen: 
        return MaterialPageRoute(builder: (_) => SplashTimerScreen());  
      case Routes.selectLanguage:
        return MaterialPageRoute(builder: (_) => SelectLanguageView()) ;
      case Routes.homeScreen:
        print('Navigating to HomeScreen');
        return MaterialPageRoute(builder: (_) => HomeScreen());

    //   case Routes.layoutScreen:
       // return MaterialPageRoute(builder: (_) => HomeScrren(onLanguageChanged: (Locale locale) {
          // Handle language change logic here
        //));

        
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Page not found!')),
          ),
        );
    }
  }
}