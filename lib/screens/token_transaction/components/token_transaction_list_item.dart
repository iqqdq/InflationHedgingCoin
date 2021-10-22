import 'dart:ui';
// ignore: import_of_legacy_library_into_null_safe
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:inflation_hedging_coin/components/gradient_text.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:intl/intl.dart';

class TokenTransactionListItemWidget extends StatefulWidget {
  final ThemeNotifier themeNotifier;
  final String image;
  final String name;
  final double value;
  final DateTime dateTime;
  final DateTime time;
  final bool showDate;
  final int status;
  final VoidCallback onTap;

  TokenTransactionListItemWidget(
      {required this.themeNotifier,
      required this.image,
      required this.name,
      required this.value,
      required this.showDate,
      required this.dateTime,
      required this.time,
      required this.status,
      required this.onTap});

  @override
  _TokenTransactionListItemState createState() =>
      _TokenTransactionListItemState();
}

class _TokenTransactionListItemState
    extends State<TokenTransactionListItemWidget> {
  @override
  Widget build(BuildContext context) {
    final fmf = FlutterMoneyFormatter(
        amount: widget.value % 1 == 0 ? widget.value : widget.value);
    final date = DateFormat.MMMd().format(widget.dateTime);
    final time = DateFormat.Hm().format(widget.dateTime);

    return Column(children: [
      SizedBox(height: widget.showDate ? 32.0 : 0.0),
      widget.showDate
          ? Text(widget.dateTime.day == DateTime.now().day ? 'Today' : date,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: widget.themeNotifier.placeholderColor))
          : Container(),
      SizedBox(height: 18.0),
      Material(
          color: Colors.transparent,
          child: InkWell(
              highlightColor: Colors.black38,
              onTap: () => widget.onTap(),
              child: Container(
                  padding: EdgeInsets.only(
                      top: 12.0, bottom: 12.0, left: 24.0, right: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Row(children: [
                        /// TOKEN IMAGE
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: CachedNetworkImage(
                              imageUrl: widget.image,
                              width: 40.0,
                              height: 40.0,
                              fit: BoxFit.cover),
                        ),
                        SizedBox(width: 10.0),

                        /// VALUE
                        Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              Text('${fmf.output.nonSymbol} ${widget.name}',
                                  style: TextStyle(
                                      fontFamily: 'NeoGramExtended',
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: widget.themeNotifier.titleColor)),
                              SizedBox(height: 4.0),

                              /// STATUS
                              Row(
                                children: [
                                  widget.status == 0
                                      ? SpinKitCircle(
                                          size: 20.0,
                                          color: widget
                                              .themeNotifier.placeholderColor)
                                      : Container(),
                                  SizedBox(
                                      width: widget.status == 0 ? 8.0 : 0.0),
                                  widget.status == 0
                                      ? Text('Pending',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 16.0,
                                              color: widget.themeNotifier
                                                  .placeholderColor))
                                      : GradientText(
                                          widget.status == 1
                                              ? 'Received'
                                              : 'Sent',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 16.0),
                                          gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                widget.themeNotifier
                                                    .lightGreenGradientColor,
                                                widget.themeNotifier
                                                    .greenGradientColor,
                                              ]),
                                        ),
                                ],
                              ),
                            ])),

                        /// TIME
                        Padding(
                          padding: EdgeInsets.only(bottom: 30.0),
                          child: Text(time,
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16.0,
                                  color:
                                      widget.themeNotifier.placeholderColor)),
                        )
                      ])),
                    ],
                  ))))
    ]);
  }
}
