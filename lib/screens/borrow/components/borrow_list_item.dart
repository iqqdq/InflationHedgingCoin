import 'dart:ui';
// ignore: import_of_legacy_library_into_null_safe
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:inflation_hedging_coin/components/custom_switch.dart';
import 'package:inflation_hedging_coin/components/gradient_text.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class BorrowListItemWidget extends StatefulWidget {
  final ThemeNotifier themeNotifier;
  final String image;
  final String name;
  final double percentValue;
  final double balanceValue;
  final bool switchState;
  final Function(bool) onSwitchTap;

  BorrowListItemWidget(
      {required this.themeNotifier,
      required this.image,
      required this.name,
      required this.percentValue,
      required this.balanceValue,
      required this.switchState,
      required this.onSwitchTap});

  @override
  _BorrowListItemState createState() => _BorrowListItemState();
}

class _BorrowListItemState extends State<BorrowListItemWidget> {
  @override
  Widget build(BuildContext context) {
    final fmfBalance = FlutterMoneyFormatter(
        amount: widget.balanceValue % 1 == 0
            ? widget.balanceValue
            : widget.balanceValue);

    return Container(
        height: 88.0,
        margin: EdgeInsets.only(bottom: 14.0),
        padding:
            EdgeInsets.only(top: 14.0, bottom: 14.0, left: 24.0, right: 24.0),
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// TOKEN
                Row(
                  children: [
                    CachedNetworkImage(
                        imageUrl: widget.image,
                        width: 24.0,
                        height: 24.0,
                        fit: BoxFit.cover),
                    SizedBox(width: 12.0),
                    Text(widget.name,
                        style: TextStyle(
                            fontFamily: 'NeoGramExtended',
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: widget.themeNotifier.placeholderColor)),
                  ],
                ),

                /// PERCENT
                Text('${widget.percentValue}%',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16.0,
                        color: widget.themeNotifier.placeholderColor)),

                /// SWITCH
                CustomSwitch(
                    themeNotifier: widget.themeNotifier,
                    value: widget.switchState,
                    onChanged: (state) => widget.onSwitchTap(state))
              ],
            ),
            SizedBox(height: 14.0),

            /// BALANCE
            Expanded(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: GradientText(
                      'Balance ${fmfBalance.output.nonSymbol} ${widget.name}',
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 14.0),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            widget.themeNotifier.blueGradientColor,
                            widget.themeNotifier.pinkGradientColor,
                          ]),
                    )))
          ],
        ));
  }
}
