import 'dart:ui';
// ignore: import_of_legacy_library_into_null_safe
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class YieldListItemWidget extends StatefulWidget {
  final ThemeNotifier themeNotifier;
  final String image;
  final String name;
  final double percentValue;
  final double usdValue;
  final VoidCallback onTap;

  YieldListItemWidget(
      {required this.themeNotifier,
      required this.image,
      required this.name,
      required this.percentValue,
      required this.usdValue,
      required this.onTap});

  @override
  _BorrowListItemState createState() => _BorrowListItemState();
}

class _BorrowListItemState extends State<YieldListItemWidget> {
  @override
  Widget build(BuildContext context) {
    final fmfUSD = FlutterMoneyFormatter(
        amount: widget.usdValue % 1 == 0 ? widget.usdValue : widget.usdValue);

    return Container(
        height: 88.0,
        margin: EdgeInsets.only(bottom: 16.0),
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
        child: Material(
            color: Colors.transparent,
            child: InkWell(
                highlightColor: Colors.black38,
                onTap: () => widget.onTap(),
                borderRadius: BorderRadius.circular(32.0),
                child: Container(
                    padding: EdgeInsets.only(
                        top: 12.0, bottom: 12.0, left: 20.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// TOKEN
                        Row(
                          children: [
                            CachedNetworkImage(
                                imageUrl: widget.image,
                                width: 36.0,
                                fit: BoxFit.fitWidth),
                            SizedBox(width: 16.0),
                            Text(widget.name,
                                style: TextStyle(
                                    fontFamily: 'NeoGramExtended',
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                    color: widget.themeNotifier.titleColor)),
                            SizedBox(width: 12.0),
                          ],
                        ),

                        Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              /// PERCENT
                              Text('${widget.percentValue}%',
                                  style: TextStyle(
                                      fontFamily: 'NeoGramExtended',
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          widget.themeNotifier.percentColor)),
                              SizedBox(height: 10.0),

                              /// PERCENT
                              Text(fmfUSD.output.compactSymbolOnLeft,
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14.0,
                                      color: widget
                                          .themeNotifier.placeholderColor)),
                            ])
                      ],
                    )))));
  }
}
