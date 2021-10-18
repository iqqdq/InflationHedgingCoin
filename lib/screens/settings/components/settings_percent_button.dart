import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class SettingsPercentButton extends StatelessWidget {
  final ThemeNotifier themeNotifier;
  final String title;
  final VoidCallback onTap;

  const SettingsPercentButton(
      {Key? key,
      required this.themeNotifier,
      required this.title,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: themeNotifier.shadowColor,
                  blurRadius: 16.0,
                  offset: Offset(0, 24))
            ],
            color: themeNotifier.inputColor,
            borderRadius: BorderRadius.circular(16.0)),
        child: Material(
            color: Colors.transparent,
            child: InkWell(
              highlightColor: Colors.black38,
              onTap: () => onTap(),
              borderRadius: BorderRadius.circular(16.0),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(title,
                    style: TextStyle(
                        fontFamily: 'NeoGramExtended',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: themeNotifier.titleColor)),
              ),
            )));
  }
}
