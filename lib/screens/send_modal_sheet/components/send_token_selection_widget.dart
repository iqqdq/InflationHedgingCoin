import 'dart:ui';
// ignore: import_of_legacy_library_into_null_safe
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:inflation_hedging_coin/components/gradient_text_widget.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class SendTokenSelectionWidget extends StatefulWidget {
  final ThemeNotifier themeNotifier;
  final String image;
  final String name;
  final double value;
  final double usdValue;
  final VoidCallback onTap;

  const SendTokenSelectionWidget({
    Key? key,
    required this.themeNotifier,
    required this.image,
    required this.name,
    required this.value,
    required this.usdValue,
    required this.onTap,
  }) : super(key: key);

  @override
  _SendTokenSelectionState createState() => _SendTokenSelectionState();
}

class _SendTokenSelectionState extends State<SendTokenSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final fmfValue = FlutterMoneyFormatter(
        amount: widget.value % 1 == 0 ? widget.value : widget.value);
    final fmfUSDValue = FlutterMoneyFormatter(
        amount: widget.usdValue % 1 == 0 ? widget.usdValue : widget.usdValue);

    return Container(
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
                child: Padding(
                    padding: EdgeInsets.only(
                        left: 24.0, top: 15.0, right: 24.0, bottom: 12.0),
                    child:

                        /// TOKEN
                        Row(
                      children: [
                        CachedNetworkImage(
                            imageUrl: widget.image,
                            width: 40.0,
                            height: 40.0,
                            fit: BoxFit.cover),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: Text(widget.name,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontFamily: 'NeoGramExtended',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: widget.themeNotifier.titleColor)),
                        ),
                        Container(
                            width: (size.width - 100.0) / 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                /// VALUE
                                GradientTextWidget(
                                  fmfValue.output.nonSymbol,
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      fontFamily: 'NeoGramExtended',
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        widget.themeNotifier.blueGradientColor,
                                        widget.themeNotifier.pinkGradientColor,
                                      ]),
                                ),
                                SizedBox(height: 8.0),
                                Text(fmfUSDValue.output.symbolOnLeft,
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 14.0,
                                        color: widget
                                            .themeNotifier.placeholderColor))
                              ],
                            ))
                      ],
                    )))));
  }
}
