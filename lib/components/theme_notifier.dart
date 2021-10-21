import 'package:flutter/material.dart';
import 'hex_color.dart';

class ThemeNotifier with ChangeNotifier {
  var backgroundColor = HexColor("0D0E12");
  var outlineColor = Colors.white10;
  var shadowColor = Colors.black26;
  var tableColor = HexColor("12141A");
  var buttonColor = HexColor("2A2F3B");
  var titleColor = Colors.white;
  var disabledTitleColor = Colors.white.withOpacity(0.2);
  var disabledButtonColor = Colors.white.withOpacity(0.08);
  var textColor = HexColor("7B7B92");
  var placeholderColor = HexColor("4C5366");
  var inputColor = HexColor("1D212C");
  var keyButtonColor = HexColor("41485B");
  var segmentedControlColor = HexColor("181920");
  var percentColor = HexColor("29CB73");
  var blueGradientColor = HexColor("20AAE5");
  var pinkGradientColor = HexColor("DB63AB");
  var lightGreenGradientColor = HexColor("63CDDB");
  var greenGradientColor = HexColor("1AB056");
  var lightOrangeGradientColor = HexColor("E4BD58");
  var orangeGradientColor = HexColor("DB6363");
}
