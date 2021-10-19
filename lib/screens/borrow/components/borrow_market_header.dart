import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class BorrowMarketHeaderWidget extends StatelessWidget {
  final ThemeNotifier themeNotifier;
  final List<String> titles;

  const BorrowMarketHeaderWidget(
      {Key? key, required this.themeNotifier, required this.titles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width / 2) - 44.0;
    final style = TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14.0,
        color: themeNotifier.placeholderColor);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: width,
          child: Text(titles[0], style: style),
        ),
        Container(
          width: width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(titles[1], style: style),
              Text(titles[2], style: style)
            ],
          ),
        )
      ],
    );
  }
}
