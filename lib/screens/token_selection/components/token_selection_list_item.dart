import 'dart:ui';
// ignore: import_of_legacy_library_into_null_safe
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class TokenSelectionItemWidget extends StatefulWidget {
  final ThemeNotifier themeNotifier;
  final String image;
  final String name;
  final VoidCallback onTap;

  TokenSelectionItemWidget(
      {required this.themeNotifier,
      required this.image,
      required this.name,
      required this.onTap});

  @override
  _TokenSelectionItemState createState() => _TokenSelectionItemState();
}

class _TokenSelectionItemState extends State<TokenSelectionItemWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
        width: size.width - 48.0,
        child: Material(
            color: Colors.transparent,
            child: InkWell(
                highlightColor: Colors.black38,
                onTap: () => widget.onTap(),
                child: Container(
                    margin: EdgeInsets.symmetric(vertical: 15.0),
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Row(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: CachedNetworkImage(
                                imageUrl: widget.image,
                                width: 40.0,
                                height: 40.0,
                                fit: BoxFit.cover),
                          ),
                          SizedBox(width: 10.0),
                          Expanded(
                              child: Text(widget.name,
                                  style: TextStyle(
                                      fontFamily: 'NeoGramExtended',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      color: widget.themeNotifier.titleColor)))
                        ])),
                      ],
                    )))));
  }
}
