import 'dart:ui';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:inflation_hedging_coin/components/gradient_text.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class YieldHorizontalListItemWidget extends StatefulWidget {
  final ThemeNotifier themeNotifier;
  final String title;
  final bool isPercent;
  final double value;
  final VoidCallback onTap;

  YieldHorizontalListItemWidget(
      {required this.themeNotifier,
      required this.title,
      required this.isPercent,
      required this.value,
      required this.onTap});

  @override
  _YieldHorizontalListItemState createState() =>
      _YieldHorizontalListItemState();
}

class _YieldHorizontalListItemState
    extends State<YieldHorizontalListItemWidget> {
  @override
  Widget build(BuildContext context) {
    final fmfUSD = FlutterMoneyFormatter(
        amount: widget.value % 1 == 0 ? widget.value : widget.value);

    return Container(
        height: 82.0,
        margin: EdgeInsets.only(right: 12.0),
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
        child: Container(
            constraints: BoxConstraints(minWidth: 190.0),
            padding: EdgeInsets.only(
                top: 12.0, bottom: 12.0, left: 24.0, right: 24.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              /// TITLE
              Text('${widget.title}',
                  style: TextStyle(
                      fontFamily: 'NeoGramExtended',
                      fontSize: 14.0,
                      color: widget.themeNotifier.placeholderColor)),
              SizedBox(height: 10.0),

              /// USD VALUE
              GradientText(
                widget.isPercent
                    ? '${widget.value}%'
                    : fmfUSD.output.compactSymbolOnLeft,
                style: TextStyle(
                    fontFamily: 'NeoGramExtended',
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      widget.themeNotifier.blueGradientColor,
                      widget.themeNotifier.pinkGradientColor,
                    ]),
              ),
            ])));
  }
}
