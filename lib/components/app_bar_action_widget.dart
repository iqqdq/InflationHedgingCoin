import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/gradient_text_widget.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class AppBarActionWidget extends StatelessWidget {
  final ThemeNotifier themeNotifier;
  final String title;
  final VoidCallback onTap;

  const AppBarActionWidget(
      {Key? key,
      required this.themeNotifier,
      required this.title,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Container(
            height: 40.0,
            child: Center(
              child: GradientTextWidget(
                title,
                style: TextStyle(
                    fontFamily: 'NeoGramExtended',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700),
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      themeNotifier.blueGradientColor,
                      themeNotifier.pinkGradientColor,
                    ]),
              ),
            )),
        onTap: () => {onTap()});
  }
}
