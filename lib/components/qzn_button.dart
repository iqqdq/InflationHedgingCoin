import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class QZNButtonWidget extends StatefulWidget {
  final ThemeNotifier themeNotifier;
  final bool? isImageOnRight;
  final String image;
  final String title;
  final VoidCallback onTap;

  QZNButtonWidget(
      {required this.themeNotifier,
      required this.image,
      required this.title,
      this.isImageOnRight,
      required this.onTap});

  @override
  _QZNButtonState createState() => _QZNButtonState();
}

class _QZNButtonState extends State<QZNButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40.0,
        decoration: BoxDecoration(
            color: widget.themeNotifier.buttonColor,
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
                      top: 9.0, bottom: 9.0, left: 12.0, right: 12.0),
                  child: Row(
                    children: [
                      widget.isImageOnRight == null
                          ? Image.asset(widget.image)
                          : Container(),
                      SizedBox(
                          width: widget.isImageOnRight == null ? 12.0 : 0.0),
                      Text(widget.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14.0,
                              color: widget.themeNotifier.titleColor)),
                      SizedBox(
                          width: widget.isImageOnRight != null ? 12.0 : 0.0),
                      widget.isImageOnRight != null
                          ? Image.asset(widget.image)
                          : Container(),
                      SizedBox(
                          width: widget.isImageOnRight != null ? 5.0 : 0.0),
                    ],
                  ),
                ))));
  }
}
