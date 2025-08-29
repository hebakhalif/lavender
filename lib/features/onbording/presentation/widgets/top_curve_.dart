import 'package:flutter/material.dart';

class TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, 50); // نبدأ من اليسار و ننزل شوية

    // نرسم قوس من اليسار لليمين في الأعلى
    path.quadraticBezierTo(
      size.width / 2, 0, // نقطة الانحناء في النص
      size.width, 50, // نهاية القوس على اليمين
    );

    path.lineTo(size.width, size.height); // باقي المستطيل
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
