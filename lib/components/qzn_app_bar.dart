import 'dart:ui';
// ignore: import_of_legacy_library_into_null_safe
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/gradient_text.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class QZNAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final ThemeNotifier themeNotifier;
  final String title;
  final String? subtitle;
  final bool? withBackButton;
  final Widget? action;
  final VoidCallback? onActionTap;

  QZNAppBarWidget(
      {required this.preferredSize,
      required this.themeNotifier,
      required this.title,
      this.subtitle,
      this.withBackButton,
      this.onActionTap,
      this.action});

  @override
  final Size preferredSize; // default is 56.0

  @override
  _QZNAppBarState createState() => _QZNAppBarState();
}

class _QZNAppBarState extends State<QZNAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: widget.themeNotifier.backgroundColor,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        titleSpacing: 10.0,
        toolbarHeight: widget.preferredSize.height,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.withBackButton != null
                    ? Container(
                        width: 40.0,
                        height: 40.0,
                        child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              highlightColor: Colors.black38,
                              onTap: () => Navigator.pop(context),
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.asset('assets/ic_arrow_back.png'),
                            )))
                    : Container(),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: AutoSizeText(widget.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'NeoGramExtended',
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                          color: widget.themeNotifier.titleColor)),
                )),
                widget.action != null
                    ? Container(
                        width: 50.0,
                        height: 40.0,
                        child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                                highlightColor: Colors.black38,
                                onTap: () => widget.onActionTap!(),
                                borderRadius: BorderRadius.circular(20.0),
                                child: Center(child: widget.action))))
                    : SizedBox(
                        width: widget.withBackButton == null ? 0.0 : 40.0)
              ],
            ),
            widget.subtitle != null ? SizedBox(height: 16.0) : Container(),
            widget.subtitle != null
                ? Row(
                    children: [
                      Expanded(
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: GradientText(
                                widget.subtitle!,
                                style: TextStyle(
                                    fontFamily: 'NeoGramExtended',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700),
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      widget.themeNotifier.blueGradientColor,
                                      widget.themeNotifier.pinkGradientColor,
                                    ]),
                              )))
                    ],
                  )
                : Container(),
          ],
        ));
  }
}
