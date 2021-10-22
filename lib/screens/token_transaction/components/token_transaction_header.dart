import 'dart:ui';
// ignore: import_of_legacy_library_into_null_safe
import 'package:auto_size_text/auto_size_text.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:inflation_hedging_coin/components/circle_button.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class TokenTransactionHeaderWidget extends StatefulWidget {
  final ThemeNotifier themeNotifier;
  final String image;
  final String name;
  final double totalValue;
  final VoidCallback onReceiveTap;
  final VoidCallback onSendTap;
  final VoidCallback onCopyTap;

  TokenTransactionHeaderWidget(
      {required this.themeNotifier,
      required this.image,
      required this.name,
      required this.totalValue,
      required this.onReceiveTap,
      required this.onSendTap,
      required this.onCopyTap});

  @override
  _TokenTransactionHeaderState createState() => _TokenTransactionHeaderState();
}

class _TokenTransactionHeaderState extends State<TokenTransactionHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    final separator = Container(
        width: 1.0, height: 62.0, color: widget.themeNotifier.outlineColor);
    final fmf = FlutterMoneyFormatter(
        amount:
            widget.totalValue % 1 == 0 ? widget.totalValue : widget.totalValue);

    return Container(
      padding: EdgeInsets.only(top: 14.0, bottom: 18.0),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: widget.themeNotifier.shadowColor,
                blurRadius: 16.0,
                offset: Offset(0, 24))
          ],
          color: widget.themeNotifier.tableColor,
          border:
              Border.all(width: 1.0, color: widget.themeNotifier.outlineColor),
          borderRadius: BorderRadius.circular(24.0)),
      child: Column(
        children: [
          CachedNetworkImage(
              imageUrl: widget.image, height: 62.0, fit: BoxFit.cover),
          SizedBox(height: 18.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            child: AutoSizeText(fmf.output.nonSymbol + ' ${widget.name}',
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'NeoGramExtended',
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
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
      ),
    );
  }
}
