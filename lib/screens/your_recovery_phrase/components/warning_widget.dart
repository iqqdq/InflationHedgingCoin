import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class WarningWidget extends StatelessWidget {
  final ThemeNotifier themeNotifier;

  const WarningWidget({Key? key, required this.themeNotifier})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            EdgeInsets.only(left: 18.0, right: 16.0, top: 10.0, bottom: 10.0),
        decoration: BoxDecoration(
            color: themeNotifier.warningBackgroundColor,
            border: Border.all(
                width: 1.0,
                color: themeNotifier.warningBackgroundColor.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(24.0)),
        child: Row(
          children: [
            Image.asset('assets/ic_warning.png'),
            SizedBox(width: 18.0),
            Expanded(
                child: Text(
                    'Never share recovery phrase with anyone, store it securely!',
                    style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'Poppins',
                        color: themeNotifier.warningColor)))
          ],
        ));
  }
}
