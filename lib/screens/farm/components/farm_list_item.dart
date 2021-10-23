import 'dart:ui';
// ignore: import_of_legacy_library_into_null_safe
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/gradient_text_widget.dart';
import 'package:inflation_hedging_coin/components/qzn_gradient_button_widget.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class FarmListItemWidget extends StatefulWidget {
  final ThemeNotifier themeNotifier;
  final String image;
  final String title;
  final String depositName;
  final String earnName;
  final double apyPercent;
  final VoidCallback onSelectTap;

  FarmListItemWidget(
      {required this.themeNotifier,
      required this.image,
      required this.title,
      required this.depositName,
      required this.earnName,
      required this.apyPercent,
      required this.onSelectTap});

  @override
  _FarmListItemState createState() => _FarmListItemState();
}

class _FarmListItemState extends State<FarmListItemWidget> {
  final _style = TextStyle(fontFamily: 'Poppins', fontSize: 20.0);
  final _valueStyle = TextStyle(
      fontFamily: 'NeoGramExtended',
      fontSize: 20.0,
      fontWeight: FontWeight.bold);

  Widget getInfoRow(String text, String value) {
    return Padding(
        padding: EdgeInsets.only(bottom: 21.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Text(text,
                    style: _style.copyWith(
                        color: widget.themeNotifier.placeholderColor))),
            Expanded(
                child: Text(value,
                    textAlign: TextAlign.end,
                    style: _valueStyle.copyWith(
                        color: widget.themeNotifier.titleColor)))
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    final separator = Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      margin: EdgeInsets.only(bottom: 19.0),
      height: 0.25,
      color: widget.themeNotifier.placeholderColor,
    );

    return Container(
        margin: EdgeInsets.only(bottom: 16.0),
        padding:
            EdgeInsets.only(top: 21.0, bottom: 24.0, left: 24.0, right: 24.0),
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
        child: Column(
          children: [
            /// TOKEN IMAGE
            CachedNetworkImage(
                imageUrl: widget.image, height: 82.0, fit: BoxFit.fitHeight),
            SizedBox(height: 14.0),

            /// TOKEN NAME
            GradientTextWidget(
              widget.title,
              style: TextStyle(
                  fontFamily: 'NeoGramExtended',
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold),
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    widget.themeNotifier.blueGradientColor,
                    widget.themeNotifier.pinkGradientColor,
                  ]),
            ),
            SizedBox(height: 24.0),
            getInfoRow('Deposit', widget.depositName),
            separator,
            getInfoRow('Earn', widget.earnName),
            separator,
            getInfoRow('APY', '${widget.apyPercent}%'),
            SizedBox(height: 3.0),
            QZNGradientButtonWidget(
                themeNotifier: widget.themeNotifier,
                title: 'Select',
                isEnable: true,
                onTap: () => {widget.onSelectTap()}),
          ],
        ));
  }
}
