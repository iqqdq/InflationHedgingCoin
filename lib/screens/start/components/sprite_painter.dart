import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui' as ui;
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class SpritePainter extends CustomPainter {
  final ThemeNotifier themeNotifier;
  final Animation<double> animation;

  SpritePainter(this.themeNotifier, this.animation) : super(repaint: animation);

  void circle(Canvas canvas, Rect rect, double value) {
    double size = rect.width;
    double area = size * size;
    double radius = sqrt(area * value / 4);

    final Paint paint = new Paint()
      ..shader = ui.Gradient.radial(rect.centerLeft, radius * 4, [
        Color.fromARGB(76, 16, 17, 21).withOpacity(1.0 - animation.value),
        Color.fromARGB(76, 16, 17, 21).withOpacity(1.0 - animation.value),
        Color.fromARGB(76, 16, 22, 41).withOpacity(1.0 - animation.value),
        Color.fromARGB(76, 18, 26, 51).withOpacity(1.0 - animation.value),
        Color.fromARGB(76, 26, 33, 62).withOpacity(1.0 - animation.value),
        Color.fromARGB(76, 31, 44, 77).withOpacity(1.0 - animation.value),
        Color.fromARGB(76, 41, 51, 75).withOpacity(1.0 - animation.value),
        Color.fromARGB(76, 55, 63, 90).withOpacity(1.0 - animation.value)
      ], [
        0.0,
        0.2447916716337204,
        0.5260416865348816,
        0.6197916865348816,
        0.71875,
        0.8385416865348816,
        0.9166666865348816,
        1.0
      ]);

    canvas.drawCircle(rect.center, radius * 1.5, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = new Rect.fromLTRB(0.0, 0.0, size.width, size.height);
    circle(canvas, rect, animation.value);
    // for (int wave = 3; wave >= 0; wave--) {
    //   circle(canvas, rect, wave * animation.value);
    // }
  }

  @override
  bool shouldRepaint(SpritePainter oldDelegate) {
    return true;
  }
}
