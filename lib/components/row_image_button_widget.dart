import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class RowImageButtonWidget extends StatelessWidget {
  final ThemeNotifier themeNotifier;
  final String title;
  final String image;
  final VoidCallback onTap;

  const RowImageButtonWidget(
      {Key? key,
      required this.themeNotifier,
      required this.title,
      required this.image,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: InkWell(
            highlightColor: Colors.black38,
            onTap: () => onTap(),
            borderRadius: BorderRadius.circular(20.0),
            child: Row(
              children: [
                Container(
                  width: 50.0,
                  height: 50.0,
                  margin: EdgeInsets.symmetric(vertical: 12.0),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: themeNotifier.shadowColor,
                            blurRadius: 16.0,
                            offset: Offset(0, 24))
                      ],
                      color: themeNotifier.tableColor,
                      border: Border.all(
                          width: 1.0, color: themeNotifier.outlineColor),
                      borderRadius: BorderRadius.circular(16.0)),
                  child: Center(
                    child: Image.asset(image),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                    child: Text(title,
                        style: TextStyle(
                            fontFamily: 'NeoGramExtended',
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: themeNotifier.titleColor)))
              ],
            )));
  }
}
