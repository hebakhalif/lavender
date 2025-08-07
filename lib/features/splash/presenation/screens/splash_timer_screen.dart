import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lavender/core/routing/router.dart';
import 'package:lavender/features/splash/presenation/cubit/splash_cubit.dart';
import 'package:lavender/features/splash/presenation/cubit/splash_state.dart';

class SplashTimerScreen extends StatefulWidget {
  const SplashTimerScreen({super.key});

  @override
  State<SplashTimerScreen> createState() => _SplashTimerScreenState();
}

class _SplashTimerScreenState extends State<SplashTimerScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SplashCubit>().startTimer(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashFinished) {
          Navigator.pushReplacementNamed(context, Routes.selectlanguage);
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              "assets/images/background_app.png",
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Center(
              child: SvgPicture.asset(
                "assets/svg/logo_lavender2.svg",
                width: 220,
                height: 172,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
