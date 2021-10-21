import 'dart:ui';
// ignore: import_of_legacy_library_into_null_safe
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class ReceiveItemWidget extends StatefulWidget {
  final ThemeNotifier themeNotifier;
  final String image;
  final String name;
  final String action;
  final double value;
  final double rateValue;
  final double apyValue;
  final double feeValue;

  ReceiveItemWidget(
      {required this.themeNotifier,
      required this.image,
      required this.name,
      required this.action,
      required this.value,
      required this.rateValue,
      required this.apyValue,
      required this.feeValue});

  @override
  _ReceiveItemState createState() => _ReceiveItemState();
}

class _ReceiveItemState extends State<ReceiveItemWidget> {
  @override
  Widget build(BuildContext context) {
    final fmfValue = FlutterMoneyFormatter(
        amount: widget.value % 1 == 0 ? widget.value : widget.value);

    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(children: [
          Container(
              margin: EdgeInsets.only(top: 24.0, bottom: 22.0),
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
                  padding: EdgeInsets.only(
                      top: 12.0, bottom: 12.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: [
                      Row(children: [
                        Text('Your ${widget.action}',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: widget.themeNotifier.placeholderColor)),

                        /// TOKEN
                        SizedBox(width: 10.0),
                        CachedNetworkImage(
                            imageUrl: widget.image,
                            width: 24.0,
                            height: 24.0,
                            fit: BoxFit.cover),
                        SizedBox(width: 8.0),
                        Expanded(
                            child: Text(widget.name,
                                style: TextStyle(
                                    fontFamily: 'NeoGramExtended',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: widget.themeNotifier.titleColor))),
                      ]),
                      SizedBox(height: 12.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// VALUE
                          Expanded(
                              child: Text(fmfValue.output.nonSymbol,
                                  style: TextStyle(
                                      fontFamily: 'NeoGramExtended',
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                      color: widget.themeNotifier.titleColor))),
                        ],
                      ),
                    ],
                  ))),

          /// RATE
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(right: 12.0),
                        child: Text('Rate',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14.0,
                                color: widget.themeNotifier.placeholderColor))),
                    Expanded(
                        child: Text(
                            '1 USDT = ${widget.rateValue} ${widget.name}',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14.0,
                                color: widget.themeNotifier.placeholderColor)))
                  ])),
          SizedBox(height: 10.0),

          /// CURRENT APY
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(right: 12.0),
                        child: Text('Current APY',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14.0,
                                color: widget.themeNotifier.placeholderColor))),
                    Expanded(
                        child: Text('${widget.apyValue}%',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14.0,
                                color: widget.themeNotifier.placeholderColor)))
                  ])),
          SizedBox(height: 10.0),

          /// FEE
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(right: 12.0),
                        child: Text('Available to deposit',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14.0,
                                color: widget.themeNotifier.placeholderColor))),
                    Expanded(
                        child: Text('${widget.feeValue} USDT',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14.0,
                                color: widget.themeNotifier.placeholderColor)))
                  ])),
        ]));
  }
}
