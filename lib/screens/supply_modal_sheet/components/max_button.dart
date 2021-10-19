import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class MaxButtonWidget extends StatefulWidget {
  final ThemeNotifier themeNotifier;
  final VoidCallback onTap;

  MaxButtonWidget({required this.themeNotifier, required this.onTap});

  @override
  _MaxButtonState createState() => _MaxButtonState();
}

class _MaxButtonState extends State<MaxButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 33.0,
        decoration: BoxDecoration(
            border: Border.all(
                width: 1.0, color: widget.themeNotifier.outlineColor),
            borderRadius: BorderRadius.circular(24.0)),
        child: Material(
            color: Colors.transparent,
            child: InkWell(
                highlightColor: Colors.black38,
                onTap: () => widget.onTap(),
                borderRadius: BorderRadius.circular(24.0),
                child: Padding(
                    padding: EdgeInsets.only(
                        top: 6.0, bottom: 6.0, left: 12.0, right: 12.0),
                    child: Center(
                      child: Text('Max',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14.0,
                              color: widget.themeNotifier.titleColor)),
                    )))));
  }
}
