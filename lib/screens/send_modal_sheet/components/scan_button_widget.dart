import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class ScanButtonWidget extends StatefulWidget {
  final ThemeNotifier themeNotifier;
  final VoidCallback onTap;

  ScanButtonWidget({required this.themeNotifier, required this.onTap});

  @override
  _ScanButtonState createState() => _ScanButtonState();
}

class _ScanButtonState extends State<ScanButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            EdgeInsets.only(left: 24.0, top: 6.0, bottom: 6.0, right: 24.0),
        height: 48.0,
        color: widget.themeNotifier.defaultKeyabordColor,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
              highlightColor: Colors.black38,
              onTap: () => widget.onTap(),
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                height: 36.0,
                decoration: BoxDecoration(
                    color: widget.themeNotifier.titleColor.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/ic_scan.png'),
                    SizedBox(width: 16.0),
                    Text('Scan',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500))
                  ],
                ),
              )),
        ));
  }
}
