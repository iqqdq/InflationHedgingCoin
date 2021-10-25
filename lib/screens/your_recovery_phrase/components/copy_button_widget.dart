import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/gradient_text_widget.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class CopyButtonWidget extends StatelessWidget {
  final ThemeNotifier themeNotifier;
  final VoidCallback onTap;

  const CopyButtonWidget(
      {Key? key, required this.themeNotifier, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: InkWell(
            highlightColor: Colors.black38,
            onTap: () => onTap(),
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
                padding: EdgeInsets.only(
                    left: 10.0, top: 6.0, bottom: 6.0, right: 10.0),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                child: Row(
                  children: [
                    Image.asset('assets/ic_gradient_copy.png'),
                    SizedBox(width: 10.0),
                    GradientTextWidget(
                      'Copy',
                      style: TextStyle(
                          fontFamily: 'NeoGramExtended',
                          fontSize: 16.0,
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
                ))));
  }
}
