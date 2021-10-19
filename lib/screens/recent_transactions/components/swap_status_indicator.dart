import 'dart:ui';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class SwapStatusIndicatorWidget extends StatefulWidget {
  final ThemeNotifier themeNotifier;
  final int status;

  SwapStatusIndicatorWidget(
      {required this.themeNotifier, required this.status});

  @override
  _SwapStatusIndicatorState createState() => _SwapStatusIndicatorState();
}

class _SwapStatusIndicatorState extends State<SwapStatusIndicatorWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
                width: 1.0, color: widget.themeNotifier.outlineColor),
            borderRadius: BorderRadius.circular(24.0)),
        child: Padding(
          padding:
              EdgeInsets.only(top: 12.0, bottom: 12.0, left: 14.0, right: 14.0),
          child: Row(
            children: [
              SpinKitCircle(
                  size: 20.0, color: widget.themeNotifier.placeholderColor),
              SizedBox(width: 24.0),
              Text(widget.status == 0 ? 'Pending' : '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16.0,
                      color: widget.themeNotifier.placeholderColor)),
            ],
          ),
        ));
  }
}
