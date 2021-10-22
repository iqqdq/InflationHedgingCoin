import 'dart:ui';
// ignore: import_of_legacy_library_into_null_safe
import 'package:auto_size_text/auto_size_text.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class WalletListItemWidget extends StatefulWidget {
  final ThemeNotifier themeNotifier;
  final String image;
  final String name;
  final double value;
  final VoidCallback onTap;

  WalletListItemWidget(
      {required this.themeNotifier,
      required this.image,
      required this.name,
      required this.value,
      required this.onTap});

  @override
  _WalletListItemState createState() => _WalletListItemState();
}

class _WalletListItemState extends State<WalletListItemWidget> {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
        fontFamily: 'NeoGramExtended',
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
        color: widget.themeNotifier.titleColor);
    final fmf = FlutterMoneyFormatter(
        amount: widget.value % 1 == 0 ? widget.value : widget.value);

    return Material(
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
                    Row(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: CachedNetworkImage(
                            imageUrl: widget.image,
                            width: 40.0,
                            height: 40.0,
                            fit: BoxFit.cover),
                      ),
                      SizedBox(width: 10.0),
                      Text(widget.name, style: textStyle),
                    ]),
                    SizedBox(width: 10.0),
                    Expanded(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: AutoSizeText(fmf.output.nonSymbol,
                                style: textStyle,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis)))
                  ],
                ))));
  }
}
