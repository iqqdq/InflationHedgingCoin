import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/gradient_text_widget.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class YieldSortItemWidget extends StatefulWidget {
  final ThemeNotifier themeNotifier;
  final int selectedIndex;
  final Function(int) onTap;

  YieldSortItemWidget(
      {required this.themeNotifier,
      required this.selectedIndex,
      required this.onTap});

  @override
  _YieldSortItemState createState() => _YieldSortItemState();
}

class _YieldSortItemState extends State<YieldSortItemWidget> {
  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width - 48.0 - 52.0 - 2.0) / 3;

    return Container(
        padding:
            EdgeInsets.only(left: 26.0, top: 10.0, bottom: 10.0, right: 26.0),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: widget.themeNotifier.shadowColor,
                  blurRadius: 16.0,
                  offset: Offset(0, 24))
            ],
            color: widget.themeNotifier.tableColor,
            border: Border.all(
                width: 1.0, color: widget.themeNotifier.outlineColor),
            borderRadius: BorderRadius.circular(32.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// MARKET TAB
            Container(
                width: width,
                child: Center(
                  child: widget.selectedIndex == 0
                      ? InkWell(
                          onTap: () => {widget.onTap(0)},
                          child: GradientTextWidget(
                            'Market',
                            style: TextStyle(
                                fontFamily: 'Poppins', fontSize: 18.0),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  widget.themeNotifier.blueGradientColor,
                                  widget.themeNotifier.pinkGradientColor,
                                ]),
                          ),
                        )
                      : InkWell(
                          onTap: () => {widget.onTap(0)},
                          child: Text(
                            'Market',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18.0,
                                color: widget.themeNotifier.placeholderColor),
                          )),
                )),

            /// M.SIZE TAB
            Container(
                width: width,
                child: Center(
                  child: widget.selectedIndex == 1
                      ? InkWell(
                          onTap: () => {widget.onTap(1)},
                          child: GradientTextWidget(
                            'M.Size',
                            style: TextStyle(
                                fontFamily: 'Poppins', fontSize: 18.0),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  widget.themeNotifier.blueGradientColor,
                                  widget.themeNotifier.pinkGradientColor,
                                ]),
                          ),
                        )
                      : InkWell(
                          onTap: () => {widget.onTap(1)},
                          child: Text(
                            'M.Size',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18.0,
                                color: widget.themeNotifier.placeholderColor),
                          )),
                )),

            /// APY TAB
            Container(
                width: width,
                child: Center(
                  child: widget.selectedIndex == 2
                      ? InkWell(
                          onTap: () => {widget.onTap(2)},
                          child: GradientTextWidget(
                            'APY',
                            style: TextStyle(
                                fontFamily: 'Poppins', fontSize: 18.0),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  widget.themeNotifier.blueGradientColor,
                                  widget.themeNotifier.pinkGradientColor,
                                ]),
                          ),
                        )
                      : InkWell(
                          onTap: () => {widget.onTap(2)},
                          child: Text(
                            'APY',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18.0,
                                color: widget.themeNotifier.placeholderColor),
                          )),
                ))
          ],
        ));
  }
}
