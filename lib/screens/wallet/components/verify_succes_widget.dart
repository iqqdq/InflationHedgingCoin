import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/qzn_gradient_button_widget.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class VerifySuccessWidget extends StatefulWidget {
  final ThemeNotifier themeNotifier;

  VerifySuccessWidget({required this.themeNotifier});

  @override
  _VerifySuccessWidgetState createState() => _VerifySuccessWidgetState();
}

class _VerifySuccessWidgetState extends State<VerifySuccessWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox.expand(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                color: widget.themeNotifier.backgroundColor.withOpacity(0.9),
                child: Center(
                    child: Container(
                        constraints: BoxConstraints(maxHeight: 406.0),
                        padding: EdgeInsets.all(18.0),
                        decoration: BoxDecoration(
                          color: widget.themeNotifier.tableColor,
                          border: Border.all(
                              width: 1.0,
                              color: widget.themeNotifier.outlineColor),
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                /// CLOSE BUTTON
                                Padding(
                                    padding: EdgeInsets.only(bottom: 4.0),
                                    child: InkWell(
                                      onTap: () => {Navigator.pop(context)},
                                      child: Image.asset('assets/ic_close.png'),
                                    )),
                              ],
                            ),
                            Image.asset('assets/ic_shield.png'),
                            Text('Your wallet was\nsuccessfully created',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'NeoGramExtended',
                                    color: widget.themeNotifier.titleColor)),
                            SizedBox(height: 24.0),
                            QZNGradientButtonWidget(
                                themeNotifier: widget.themeNotifier,
                                title: 'OK',
                                isEnable: true,
                                onTap: () => {Navigator.pop(context)}),
                          ],
                        ))))));
  }
}
