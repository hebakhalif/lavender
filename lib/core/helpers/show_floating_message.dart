 // helper: show a floating/snack-style message
  import 'package:flutter/material.dart';

void showFloatingMessage(BuildContext context, String message,
    {Color background = Colors.green, int seconds = 2}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.white)),
        backgroundColor: background.withOpacity(0.95),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: Duration(seconds: seconds),
      ),
    );
  }