import 'dart:ui';
import 'package:dashed_circle/dashed_circle.dart';
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/gradient_text.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class BorrowNetApyWidget extends StatelessWidget {
  final ThemeNotifier themeNotifier;
  final double value;

  const BorrowNetApyWidget(
      {Key? key, required this.themeNotifier, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DashedCircle(
      color: themeNotifier.placeholderColor.withOpacity(0.5),
      strokeWidth: 0.5,
      child: Container(
        width: 108.0,
        height: 108.0,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(54.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Net APY',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12.0,
                    color: themeNotifier.titleColor)),
            SizedBox(height: 3.0),
            GradientText(
              '$value%',
              style: TextStyle(
                  fontFamily: 'NeoGramExtended',
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    themeNotifier.blueGradientColor,
                    themeNotifier.pinkGradientColor,
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
