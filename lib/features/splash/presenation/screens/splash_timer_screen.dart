import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lavender/features/splash/presenation/view_model/view_model.dart';

class SplashTimerScreen extends StatefulWidget {
  const SplashTimerScreen({super.key});

  @override
  State<SplashTimerScreen> createState() => _SplashTimerScreenState();
}

class _SplashTimerScreenState extends State<SplashTimerScreen> {
  final SplashTimerViewModel viewModel = SplashTimerViewModel();
  
  // very very important
   @override
  void initState() {
    super.initState();
    viewModel.startTimer(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/background_app.png",
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  "assets/svg/logo_lavender2.svg",
                  width: 220,
                  height: 172,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
