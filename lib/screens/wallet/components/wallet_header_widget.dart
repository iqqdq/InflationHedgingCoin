import 'dart:ui';
// ignore: import_of_legacy_library_into_null_safe
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:inflation_hedging_coin/components/circle_button_widget.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class WalletHeaderWidget extends StatefulWidget {
  final ThemeNotifier themeNotifier;
  final double totalValue;
  final VoidCallback onReceiveTap;
  final VoidCallback onSendTap;
  final VoidCallback onCopyTap;

  WalletHeaderWidget(
      {required this.themeNotifier,
      required this.totalValue,
      required this.onReceiveTap,
      required this.onSendTap,
      required this.onCopyTap});

  @override
  _WalletHeaderState createState() => _WalletHeaderState();
}

class _WalletHeaderState extends State<WalletHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    final separator = Container(
        width: 1.0, height: 62.0, color: widget.themeNotifier.outlineColor);
    final fmf = FlutterMoneyFormatter(
        amount:
            widget.totalValue % 1 == 0 ? widget.totalValue : widget.totalValue);

    return Container(
        padding: EdgeInsets.only(top: 14.0, bottom: 18.0),
        height: 200.0,
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
            borderRadius: BorderRadius.circular(24.0)),
        child: Column(
          children: [
            Text('Total Value',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 17.0,
                    color: widget.themeNotifier.textColor)),
            SizedBox(height: 11.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: AutoSizeText(r'$' + fmf.output.nonSymbol,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'NeoGramExtended',
                      fontWeight: FontWeight.w600,
                      fontSize: 40.0,
                      color: widget.themeNotifier.titleColor)),
            ),
            SizedBox(height: 21.0),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  QZNCircleButtonWidget(
                    themeNotifier: widget.themeNotifier,
                    title: 'Receive',
                    image: 'assets/ic_qr_code.png',
                    onTap: () => {widget.onReceiveTap()},
                  ),
                  separator,
                  QZNCircleButtonWidget(
                    themeNotifier: widget.themeNotifier,
                    title: 'Send',
                    image: 'assets/ic_send.png',
                    onTap: () => {widget.onSendTap()},
                  ),
                  separator,
                  QZNCircleButtonWidget(
                    themeNotifier: widget.themeNotifier,
                    title: 'Copy',
                    image: 'assets/ic_copy.png',
                    onTap: () => {widget.onCopyTap()},
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
