import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui' as ui;
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class SpritePainter extends CustomPainter {
  final ThemeNotifier themeNotifier;
  final Animation<double> animation;

  SpritePainter(this.themeNotifier, this.animation) : super(repaint: animation);

  void circle(Canvas canvas, Rect rect, double value) {
    double size = rect.width / 2;
    double area = size * size;
    double radius = sqrt(area * value / 4);

    final Paint paint = new Paint()
      ..shader = ui.Gradient.linear(rect.centerLeft, rect.centerRight, [
        Color.fromARGB(76, 16, 17, 21),
        Color.fromARGB(76, 16, 17, 21),
        Color.fromARGB(76, 16, 22, 41),
        Color.fromARGB(76, 18, 26, 51),
        Color.fromARGB(76, 26, 33, 62),
        Color.fromARGB(76, 31, 44, 77),
        Color.fromARGB(76, 41, 51, 75),
        Color.fromARGB(76, 55, 63, 90)
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

    canvas.drawCircle(rect.center, radius * 3, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = new Rect.fromLTRB(0.0, 0.0, size.width, size.height);

    for (int wave = 3; wave >= 0; wave--) {
      circle(canvas, rect, wave + animation.value);
    }
  }

  @override
  bool shouldRepaint(SpritePainter oldDelegate) {
    return true;
  }
}
