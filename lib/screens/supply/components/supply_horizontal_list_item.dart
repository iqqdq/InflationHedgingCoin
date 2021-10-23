import 'dart:ui';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:inflation_hedging_coin/components/gradient_text_widget.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class SupplyHorizontalListItemWidget extends StatefulWidget {
  final ThemeNotifier themeNotifier;
  final String title;
  final int index;
  final bool isPercent;
  final double value;

  SupplyHorizontalListItemWidget(
      {required this.themeNotifier,
      required this.index,
      required this.title,
      required this.isPercent,
      required this.value});

  @override
  _SupplyHorizontalListItemState createState() =>
      _SupplyHorizontalListItemState();
}

class _SupplyHorizontalListItemState
    extends State<SupplyHorizontalListItemWidget> {
  @override
  Widget build(BuildContext context) {
    final fmfUSD = FlutterMoneyFormatter(
        amount: widget.value % 1 == 0 ? widget.value : widget.value);

    return Container(
        height: 88.0,
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
                      fontFamily: 'Poppins',
                      fontSize: 14.0,
                      color: widget.themeNotifier.placeholderColor)),
              SizedBox(height: 10.0),

              /// VALUE
              GradientTextWidget(
                widget.index == 0
                    ? '${fmfUSD.output.compactNonSymbol} USDT'
                    : widget.index == 1
                        ? '${widget.value}%'
                        : widget.index == 2
                            ? '${widget.value} CUSDT'
                            : r'$' + '${fmfUSD.output.compactNonSymbol}',
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
