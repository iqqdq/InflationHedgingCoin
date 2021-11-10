import 'dart:ui';
// ignore: import_of_legacy_library_into_null_safe
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:inflation_hedging_coin/components/qzn_button_widget.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';
import 'package:inflation_hedging_coin/screens/recent_transactions/components/swap_status_indicator.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:intl/intl.dart';

class SwapDetailsWidget extends StatefulWidget {
  final ThemeNotifier themeNotifier;
  final String fromImage;
  final double fromValue;
  final String fromName;
  final String toImage;
  final double toValue;
  final String toName;
  final double feeUSDValue;
  final double feeETHValue;
  final int status;
  final DateTime dateTime;
  final String link;

  SwapDetailsWidget(
      {required this.themeNotifier,
      required this.fromImage,
      required this.fromValue,
      required this.fromName,
      required this.toImage,
      required this.toValue,
      required this.toName,
      required this.feeUSDValue,
      required this.feeETHValue,
      required this.status,
      required this.dateTime,
      required this.link});

  @override
  _SwapDetailsState createState() => _SwapDetailsState();
}

class _SwapDetailsState extends State<SwapDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
        fontFamily: 'NeoGramExtended',
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: widget.themeNotifier.titleColor);
    final fromFmf = FlutterMoneyFormatter(
        amount:
            widget.fromValue % 1 == 0 ? widget.fromValue : widget.fromValue);
    final toFmf = FlutterMoneyFormatter(
        amount: widget.toValue % 1 == 0 ? widget.toValue : widget.toValue);
    final date = DateFormat.yMMMd().format(widget.dateTime);
    final minute = widget.dateTime.minute.toString().length > 1
        ? '${widget.dateTime.minute}'
        : '0${widget.dateTime.minute}';

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          SizedBox.expand(
              child: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                color: widget.themeNotifier.backgroundColor.withOpacity(0.9)),
            onTap: () => Navigator.pop(context),
          )),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Center(
                  child: Container(
                      padding: EdgeInsets.all(18.0),
                      decoration: BoxDecoration(
                        color: widget.themeNotifier.tableColor,
                        border: Border.all(
                            width: 1.0,
                            color: widget.themeNotifier.outlineColor),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: Wrap(children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: Padding(
                                          padding: EdgeInsets.only(left: 5.0),
                                          child: Text('Swap Details',
                                              style: TextStyle(
                                                  fontFamily: 'NeoGramExtended',
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w700,
                                                  color: widget.themeNotifier
                                                      .titleColor)))),

                                  /// CLOSE BUTTON
                                  Padding(
                                      padding: EdgeInsets.only(bottom: 4.0),
                                      child: InkWell(
                                        onTap: () => Navigator.pop(context),
                                        child:
                                            Image.asset('assets/ic_close.png'),
                                      )),
                                ],
                              ),
                              SizedBox(height: 16.0),

                              /// FROM
                              Padding(
                                  padding: EdgeInsets.only(left: 5.0),
                                  child: Row(children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 15.0),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          child: CachedNetworkImage(
                                              imageUrl: widget.fromImage,
                                              width: 40.0,
                                              height: 40.0,
                                              fit: BoxFit.cover)),
                                    ),
                                    Expanded(
                                        child: Text(
                                            fromFmf.output.nonSymbol +
                                                ' ${widget.fromName}',
                                            style: style)),
                                  ])),

                              /// STATUS
                              Padding(
                                  padding: EdgeInsets.only(left: 5.0),
                                  child: Row(children: [
                                    Image.asset('assets/ic_arrow_pending.png',
                                        width: 40.0),
                                    SizedBox(width: 15.0),
                                    Text(
                                        r'Fee $' +
                                            widget.feeUSDValue.toString(),
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 14.0,
                                            color: widget
                                                .themeNotifier.textColor)),
                                    SizedBox(width: 6.0),
                                    Text(widget.feeETHValue.toString() + ' ETH',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 14.0,
                                            color: widget.themeNotifier
                                                .placeholderColor))
                                  ])),
                              SwapStatusIndicatorWidget(
                                  themeNotifier: widget.themeNotifier,
                                  status: 0),
                              SizedBox(height: 16.0),

                              /// TO
                              Padding(
                                  padding: EdgeInsets.only(left: 5.0),
                                  child: Row(children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 15.0),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          child: CachedNetworkImage(
                                              imageUrl: widget.toImage,
                                              width: 40.0,
                                              height: 40.0,
                                              fit: BoxFit.cover)),
                                    ),
                                    Expanded(
                                        child: Text(
                                            toFmf.output.nonSymbol +
                                                ' ${widget.toName}',
                                            style: style)),
                                  ])),
                              SizedBox(height: 22.0),
                              Padding(
                                  padding: EdgeInsets.only(left: 5.0),
                                  child: Text('Timestamp',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 14.0,
                                          color: widget.themeNotifier
                                              .placeholderColor))),
                              SizedBox(height: 6.0),
                              Padding(
                                  padding: EdgeInsets.only(left: 5.0),
                                  child: Text(
                                      '${widget.dateTime.hour}:$minute, $date',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 14.0,
                                          color:
                                              widget.themeNotifier.textColor))),
                              SizedBox(height: 24.0),
                              Align(
                                  alignment: Alignment.center,
                                  child: FittedBox(
                                      child: QZNButtonWidget(
                                          themeNotifier: widget.themeNotifier,
                                          title: 'View on Etherscan',
                                          image: 'assets/ic_arrow_link.png',
                                          isImageOnRight: true,
                                          onTap: () => {})))
                            ])
                      ]))))
        ]));
  }
}
