import 'package:flutter/widgets.dart';

class OnboardingModel {
  final String imagePath;
  final String title;
  final String subtitle;
  final double progress;
  final Color backgroundColor;
  const OnboardingModel({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.progress,
    required this.backgroundColor
  });
}