import 'package:flutter/material.dart';
import 'package:lavender/core/routing/router.dart';
import 'package:lavender/features/Questions/presenation/screens/home_screen.dart';
import 'package:lavender/features/onbording/presentation/screens/onbpording_screen.dart';
import 'package:lavender/features/sign_up/presentation/screens/login_or_signup_Screen.dart';
import 'package:lavender/features/sign_in/presentation/screens/sign_in.dart';
import 'package:lavender/features/sign_up/presentation/screens/sign_up.dart';
import 'package:lavender/features/splash/presenation/screens/select_language.dart';
import 'package:lavender/features/splash/presenation/screens/splash_timer_screen.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashTimerScreen:
        return MaterialPageRoute(builder: (_) => SplashTimerScreen());
      case Routes.selectlanguage:
        return MaterialPageRoute(builder: (_) => SelectLanguage());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.onbpordingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case Routes.loginOrSignupScreen:
        return MaterialPageRoute(builder: (_) => LoginOrSignupScreen());
        case Routes.signInScreen:
        return MaterialPageRoute(builder: (_) => SignInScreen());
        case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) => SignUpScreen());

      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(body: Center(child: Text('Page not found!'))),
        );
    }
  }
}
