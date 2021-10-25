import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class RecoveryPhraseButtonWidget extends StatefulWidget {
  final ThemeNotifier themeNotifier;
  final VoidCallback onTap;

  RecoveryPhraseButtonWidget(
      {required this.themeNotifier, required this.onTap});

  @override
  _RecoveryPhraseButtonState createState() => _RecoveryPhraseButtonState();
}

class _RecoveryPhraseButtonState extends State<RecoveryPhraseButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: widget.themeNotifier.tableColor,
            border: Border.all(
                width: 1.0, color: widget.themeNotifier.outlineColor),
            borderRadius: BorderRadius.circular(24.0),
            boxShadow: [
              BoxShadow(
                  color: widget.themeNotifier.shadowColor,
                  blurRadius: 16.0,
                  offset: Offset(0, 24))
            ]),
        child: Material(
            color: Colors.transparent,
            child: InkWell(
                highlightColor: Colors.black38,
                onTap: () => widget.onTap(),
                borderRadius: BorderRadius.circular(24.0),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 20.0, bottom: 20.0, left: 24.0, right: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Enter recovery phrase',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18.0,
                              color: widget.themeNotifier.titleColor)),
                      SizedBox(width: 24.0),
                      Image.asset('assets/ic_circle_arrow_down.png')
                    ],
                  ),
                ))));
  }
}
