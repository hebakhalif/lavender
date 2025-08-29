import 'package:flutter/material.dart';
import 'package:lavender/features/onbording/presentation/widgets/Circle_Painter.dart';

class CircularProgressIndicatorWidget extends StatelessWidget {
  final double progress;    // من 0.0 إلى 1.0
  final VoidCallback? onNext;

  const CircularProgressIndicatorWidget({
   required  this.progress,
     this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // 1) نستخدم CustomPaint بدل CircularProgressIndicator
        CustomPaint(
          size: Size(55, 55),
          painter: CirclePainter(
            segmentCount: 3,
            progress: progress,
            strokeWidth: 7,
            backgroundColor: Colors.white.withOpacity(0.3),
            foregroundColor: const Color.fromARGB(255, 162, 161, 245),
          ),
        ),
        // 2) الزر الداخلي
        
        GestureDetector(
          onTap: onNext,
            child: Center(
              child: Icon(
                Icons.arrow_forward_ios,
                color: const Color.fromARGB(255, 152, 151, 232),
                size: 24,
              ),
            ),
          ),
      ],
    );
}
}