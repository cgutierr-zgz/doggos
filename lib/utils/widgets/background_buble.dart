import 'dart:ui' as ui;

import 'package:doggos/utils/utils.dart';
import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  static const colorThree = Colors.red;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = ui.Gradient.linear(
        ui.Offset.zero,
        const ui.Offset(400, 0),
        [AppColors.green, AppColors.blue],
      );

    final path = Path()
      ..lineTo(0, size.height * 0.6)
      ..quadraticBezierTo(
        size.width * 0.25,
        size.height * 0.5,
        size.width * 0.5,
        size.height * 0.6,
      )
      ..quadraticBezierTo(
        size.width * 0.75,
        size.height * 0.7,
        size.width,
        size.height * 0.7,
      )
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class BackgroundBubble extends StatelessWidget {
  const BackgroundBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return CustomPaint(
      size: Size(double.infinity, size.height * 0.6),
      painter: CurvePainter(),
    );
  }
}
