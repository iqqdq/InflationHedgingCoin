import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/gradient_text.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:intl/intl.dart';

class RecentTransactionListItemWidget extends StatefulWidget {
  final ThemeNotifier themeNotifier;
  final String fromImage;
  final String fromName;
  final double fromValue;
  final String toName;
  final String toImage;
  final double toValue;
  final DateTime dateTime;
  final bool showDate;

  RecentTransactionListItemWidget(
      {required this.themeNotifier,
      required this.showDate,
      required this.fromImage,
      required this.fromName,
      required this.fromValue,
      required this.toName,
      required this.toImage,
      required this.toValue,
      required this.dateTime});

  @override
  _RecentTransactionListItemState createState() =>
      _RecentTransactionListItemState();
}

class _RecentTransactionListItemState
    extends State<RecentTransactionListItemWidget> {
  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
        fontFamily: 'NeoGramExtended',
        fontSize: 22.0,
        fontWeight: FontWeight.bold);
    final minute = widget.dateTime.minute.toString().length > 1
        ? '${widget.dateTime.minute}'
        : '0${widget.dateTime.minute}';
    final date = DateFormat.MMMd().format(widget.dateTime);

    return Column(
      children: [
        widget.showDate
            ? Text(widget.dateTime.day == DateTime.now().day ? 'Today' : date,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: widget.themeNotifier.placeholderColor))
            : Container(),
        SizedBox(height: widget.showDate ? 21.0 : 0.0),
        Container(
            margin: EdgeInsets.only(bottom: 21.0),
            padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
            width: MediaQuery.of(context).size.width - 48.0,
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Expanded(
                    child: Row(children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 10.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: CachedNetworkImage(
                            imageUrl: widget.fromImage,
                            width: 24.0,
                            height: 24.0,
                            fit: BoxFit.cover)),
                  ),
                  Expanded(
                      child: Text(widget.fromName,
                          style: TextStyle(
                              fontFamily: 'NeoGramExtended',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: widget.themeNotifier.titleColor)))
                ])),
                Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: Text('${widget.dateTime.hour}:$minute',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: widget.themeNotifier.placeholderColor))),
              ]),
              SizedBox(height: 6.0),
              Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 16.0),
                  child: GradientText(
                    widget.fromValue.toString(),
                    style: style,
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          widget.themeNotifier.blueGradientColor,
                          widget.themeNotifier.pinkGradientColor,
                        ]),
                  )),
              SizedBox(height: 12.0),
              Image.asset(
                'assets/ic_recent_separator.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(height: 12.0),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Expanded(
                    child: Row(children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 10.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: CachedNetworkImage(
                            imageUrl: widget.toImage,
                            width: 24.0,
                            height: 24.0,
                            fit: BoxFit.cover)),
                  ),
                  Expanded(
                      child: Text(widget.toName,
                          style: TextStyle(
                              fontFamily: 'NeoGramExtended',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: widget.themeNotifier.titleColor)))
                ])),
              ]),
              SizedBox(height: 6.0),
              Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 16.0),
                  child: GradientText(
                    widget.toValue.toString(),
                    style: style,
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          widget.themeNotifier.blueGradientColor,
                          widget.themeNotifier.pinkGradientColor,
                        ]),
                  )),
            ]))
      ],
    );
  }
}
