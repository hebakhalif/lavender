import 'package:flutter/material.dart';
import 'package:lavender/core/routing/app_router.dart';
import 'package:lavender/lavender.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Lavender(appRouter: AppRouter()));
}
