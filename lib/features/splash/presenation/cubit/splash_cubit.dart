import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavender/core/routing/app_router.dart';
import 'package:lavender/features/splash/presenation/cubit/splash_state.dart';
final AppRouter appRouter = AppRouter();
 
class SplashCubit extends Cubit<SplashState> {
  SplashCubit():super(SplashInitial());
  
  void selectedLang(String lang){
    
  }
  void startTimer(BuildContext context) {
    Timer(const Duration(seconds: 4), () {
      emit(SplashFinished());
    }
       );
    }
  }

