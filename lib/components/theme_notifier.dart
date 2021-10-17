import 'package:flutter/material.dart';
import 'hex_color.dart';

class ThemeNotifier with ChangeNotifier {
  var backgroundColor = HexColor("0D0E12");
  var outlineColor = HexColor("1E2025");
  var shadowColor = Colors.black26;
  var tableColor = HexColor("12141A");
  var titleColor = Colors.white;
  var textColor = HexColor("7B7B92");
  var blueGradientColor = HexColor("20AAE5");
  var pinkGradientColor = HexColor("DB63AB");
}
