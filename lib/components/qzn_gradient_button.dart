import 'dart:ui';
// ignore: import_of_legacy_library_into_null_safe
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class QZNGradientButton extends StatefulWidget {
  final ThemeNotifier themeNotifier;
  final String title;
  final bool isEnable;
  final VoidCallback onTap;

  QZNGradientButton(
      {required this.themeNotifier,
      required this.title,
      required this.isEnable,
      required this.onTap});

  @override
  _QZNGradientButtonState createState() => _QZNGradientButtonState();
}

class _QZNGradientButtonState extends State<QZNGradientButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 60.0),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              widget.isEnable
                  ? widget.themeNotifier.blueGradientColor
                  : widget.themeNotifier.disabledButtonColor,
              widget.isEnable
                  ? widget.themeNotifier.pinkGradientColor
                  : widget.themeNotifier.disabledButtonColor,
            ],
          ),
          borderRadius: BorderRadius.circular(24.0)),
      child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: widget.isEnable ? Colors.black54 : Colors.transparent,
            highlightColor:
                widget.isEnable ? Colors.black54 : Colors.transparent,
            borderRadius: BorderRadius.circular(24.0),
            child: Padding(
                padding: EdgeInsets.only(
                    left: 15.0, top: 2.0, right: 15.0, bottom: 2.0),
                child: Center(
                    child: AutoSizeText(
                  widget.title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                      color: widget.isEnable
                          ? widget.themeNotifier.titleColor
                          : widget.themeNotifier.disabledTitleColor,
                      fontFamily: 'NeoGramExtended',
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700),
                ))),
            onTap: () => widget.isEnable ? widget.onTap() : print('disabled'),
          )),
    );
  }
}
