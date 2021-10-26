import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class RecoveryGradientTagWidget extends StatelessWidget {
  final ThemeNotifier themeNotifier;
  final String title;
  final VoidCallback onCloseTap;

  const RecoveryGradientTagWidget(
      {required this.themeNotifier,
      required this.title,
      required this.onCloseTap});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
        child: Container(
            margin: EdgeInsets.only(bottom: 12.0),
            padding:
                EdgeInsets.only(left: 6.0, top: 4.0, bottom: 4.0, right: 6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    themeNotifier.blueGradientColor,
                    themeNotifier.pinkGradientColor,
                  ]),
            ),
            child: Row(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: themeNotifier.titleColor),
                ),
                SizedBox(width: 6.0),
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: Image.asset('assets/ic_close.png',
                      color: themeNotifier.titleColor,
                      width: 16.0,
                      height: 16.0),
                  onTap: () => {onCloseTap()},
                )
              ],
            )));
  }
}
