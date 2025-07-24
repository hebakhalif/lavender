import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lavender/core/routing/app_router.dart';
import 'package:lavender/core/routing/router.dart';
final AppRouter appRouter = AppRouter();
 
class SplashTimerViewModel {
  void startTimer(BuildContext context) {
    Timer(const Duration(seconds: 4), () {
       Navigator.pushReplacementNamed(context, Routes.selectlanguage);
    }
       );
    }
  }

