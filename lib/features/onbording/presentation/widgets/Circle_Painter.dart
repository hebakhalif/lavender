import 'dart:math';
import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  final int segmentCount;       // عدد القطع (3 في حالتك)
  final double progress;        // نسبة التقدم من 0.0 إلى 1.0
  final double strokeWidth;     // سمك الخط
  final Color backgroundColor;  // لون الخلفية (القطع غير المنجزة)
  final Color foregroundColor;  // لون القطع المنجزة

  CirclePainter({
    required this.segmentCount,
    required this.progress,
    required this.strokeWidth,
    required this.backgroundColor,
    required this.foregroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;
    final double startOffset = -pi / 2;              // بداية الرسم من الأعلى
    final double totalAngle = 2 * pi;
    final double gapAngle = pi / 60;                 // مقدار الفجوة (≈3°)
    final double segmentAngle = 
        (totalAngle - gapAngle * segmentCount) / segmentCount;

    final Paint bgPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = backgroundColor
      ..strokeCap = StrokeCap.round;

    final Paint fgPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = foregroundColor
      ..strokeCap = StrokeCap.round;

    // 1) نرسم أولاً كل القطع بلون الخلفية
    for (int i = 0; i < segmentCount; i++) {
      final double startAngle = startOffset + i * (segmentAngle + gapAngle);
      canvas.drawArc(
        rect,
        startAngle,
        segmentAngle,
        false,
        bgPaint,
      );
    }

    // 2) نحسب عدد القطع المكتملة والجزء الجزئي
    double progressSegments = progress * segmentCount;
    int fullSegments = progressSegments.floor();
    double partialSegmentFraction = progressSegments - fullSegments;

    // 3) نرسم القطع الكاملة باللون الأمامي
    for (int i = 0; i < fullSegments; i++) {
      final double startAngle = startOffset + i * (segmentAngle + gapAngle);
      canvas.drawArc(
        rect,
        startAngle,
        segmentAngle,
        false,
        fgPaint,
      );
    }
    // 4) نرسم الجزء الجزئي من القطعة الحالية (إن وجد)
    if (fullSegments < segmentCount && partialSegmentFraction > 0) {
      final double startAngle = startOffset + fullSegments * (segmentAngle + gapAngle);
      canvas.drawArc(
        rect,
        startAngle,
        segmentAngle * partialSegmentFraction,
        false,
        fgPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CirclePainter old) {
    return old.progress != progress;
  }
}