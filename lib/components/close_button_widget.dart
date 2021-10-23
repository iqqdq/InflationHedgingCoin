import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class CloseButtonWidget extends StatelessWidget {
  final ThemeNotifier themeNotifier;

  const CloseButtonWidget({Key? key, required this.themeNotifier})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 24.0),
        width: 50.0,
        height: 40.0,
        child: Material(
            color: Colors.transparent,
            child: InkWell(
                highlightColor: Colors.black38,
                onTap: () => {Navigator.pop(context)},
                borderRadius: BorderRadius.circular(20.0),
                child: Center(
                    child: Text(
                  'Close',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16.0,
                      color: themeNotifier.placeholderColor),
                )))));
  }
}
