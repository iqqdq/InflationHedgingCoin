import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/gradient_text_widget.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class RecentListItemWidget extends StatelessWidget {
  final ThemeNotifier themeNotifier;
  final String wallet;
  final VoidCallback onTap;

  RecentListItemWidget(
      {required this.themeNotifier, required this.wallet, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: InkWell(
            highlightColor: Colors.black38,
            onTap: () => onTap(),
            child: Container(
                padding: EdgeInsets.only(
                  top: 10.0,
                  bottom: 10.0,
                  left: 24.0,
                  right: 24.0,
                ),
                child: GradientTextWidget(
                  wallet,
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 16.0),
                  textAlign: TextAlign.start,
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        themeNotifier.blueGradientColor,
                        themeNotifier.pinkGradientColor,
                      ]),
                ))));
  }
}
