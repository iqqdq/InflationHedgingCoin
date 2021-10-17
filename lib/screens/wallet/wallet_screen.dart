// ignore: import_of_legacy_library_into_null_safe
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class WalletScreenWidget extends StatefulWidget {
  const WalletScreenWidget({Key? key}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreenWidget> {
  final _themeNotifier = ThemeNotifier();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _themeNotifier.backgroundColor,
        body: SizedBox.expand(
            child: Stack(
          children: [
            Padding(
                padding: EdgeInsets.only(left: 24.0, top: 28.0, right: 24.0)),
            ListView.builder(
                padding: EdgeInsets.only(
                    left: 24.0, top: 32.0, right: 24.0, bottom: 120.0),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Container();
                })
          ],
        )));
  }
}


// AutoSizeText(r'$1,345,175',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//                 fontFamily: 'NeoGramExtended',
//                 fontWeight: FontWeight.bold,
//                 fontSize: 40.0,
//                 color: _themeNotifier.titleColor)),