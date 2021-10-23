import 'package:flutter/material.dart';

class GradientTextWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Gradient gradient;
  final TextAlign? textAlign;

  const GradientTextWidget(this.text,
      {required this.gradient, this.style, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text,
          textAlign: textAlign == null ? TextAlign.center : textAlign,
          style: style),
    );
  }
}
