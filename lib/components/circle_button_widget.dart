import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class QZNCircleButtonWidget extends StatefulWidget {
  final ThemeNotifier themeNotifier;
  final String title;
  final String image;
  final VoidCallback onTap;

  QZNCircleButtonWidget(
      {required this.title,
      required this.image,
      required this.onTap,
      required this.themeNotifier});

  @override
  _QZNCircleButtonState createState() => _QZNCircleButtonState();
}

class _QZNCircleButtonState extends State<QZNCircleButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Material(
            color: Colors.transparent,
            child: InkWell(
                highlightColor: Colors.black38,
                onTap: () => widget.onTap(),
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  widget.themeNotifier.blueGradientColor,
                                  widget.themeNotifier.pinkGradientColor
                                ],
                              )),
                          child: Center(child: Image.asset(widget.image))),
                      SizedBox(
                        height: 7.0,
                      ),
                      Text(widget.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14.0,
                              color: widget.themeNotifier.textColor)),
                    ],
                  ),
                ))));
  }
}
