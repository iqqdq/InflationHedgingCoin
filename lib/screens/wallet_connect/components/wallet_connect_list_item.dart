import 'dart:ui';
// ignore: import_of_legacy_library_into_null_safe
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class WalletConnectListItemWidget extends StatefulWidget {
  final ThemeNotifier themeNotifier;
  final String image;
  final String name;
  final VoidCallback onTap;

  WalletConnectListItemWidget(
      {required this.themeNotifier,
      required this.image,
      required this.name,
      required this.onTap});

  @override
  _WalletConnectListItemState createState() => _WalletConnectListItemState();
}

class _WalletConnectListItemState extends State<WalletConnectListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: InkWell(
            highlightColor:
                widget.themeNotifier.placeholderColor.withOpacity(0.5),
            onTap: () => widget.onTap(),
            borderRadius: BorderRadius.circular(16.0),
            child: Container(
                padding: EdgeInsets.only(
                    top: 20.0, bottom: 20.0, left: 16.0, right: 16.0),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: CachedNetworkImage(
                            imageUrl: widget.image,
                            width: 32.0,
                            height: 32.0,
                            fit: BoxFit.cover),
                      ),
                      SizedBox(width: 16.0),
                      Text(widget.name,
                          style: TextStyle(
                              fontFamily: 'NeoGramExtended',
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: widget.themeNotifier.titleColor)),
                    ]),
                    Image.asset('assets/ic_arrow_right.png')
                  ],
                ))));
  }
}
