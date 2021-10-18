import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class PointerWidget extends StatelessWidget {
  final ThemeNotifier themeNotifier;

  const PointerWidget({Key? key, required this.themeNotifier})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      height: 40.0,
      margin: EdgeInsets.symmetric(vertical: 12.0),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: themeNotifier.shadowColor,
                blurRadius: 16.0,
                offset: Offset(0, 24))
          ],
          color: themeNotifier.tableColor,
          border: Border.all(width: 1.0, color: themeNotifier.outlineColor),
          borderRadius: BorderRadius.circular(20.0)),
      child: Center(
        child: Image.asset('assets/ic_arrow_down.png'),
      ),
    );
  }
}
