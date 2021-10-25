import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class CheckboxWidget extends StatefulWidget {
  final ThemeNotifier themeNotifier;
  final bool isSelected;
  final VoidCallback onTap;

  CheckboxWidget(
      {required this.themeNotifier,
      required this.isSelected,
      required this.onTap});

  @override
  _CheckboxState createState() => _CheckboxState();
}

class _CheckboxState extends State<CheckboxWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: InkWell(
            highlightColor: Colors.black38,
            onTap: () => widget.onTap(),
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
                width: 28.0,
                height: 28.0,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          widget.themeNotifier.blueGradientColor,
                          widget.themeNotifier.pinkGradientColor,
                        ]),
                    borderRadius: BorderRadius.circular(10.0)),
                child: widget.isSelected
                    ? Container(
                        child: Center(
                          child: Image.asset('assets/ic_checkbox_selected.png'),
                        ),
                      )
                    : Center(
                        child: Container(
                          width: 26.0,
                          height: 26.0,
                          decoration: BoxDecoration(
                              color: widget.themeNotifier.backgroundColor,
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                      ))));
  }
}
