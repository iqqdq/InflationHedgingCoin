// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/qzn_gradient_button_widget.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';
import 'package:inflation_hedging_coin/screens/start/components/create_wallet_button_widget.dart';

class StartScreenWidget extends StatefulWidget {
  const StartScreenWidget({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreenWidget> {
  final _themeNotifier = ThemeNotifier();

  // MARK: -
  // MARK: - ACTIONS

  void connectWalletDidTap() {}

  void createWalletDidTap() {}

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;

    return Scaffold(
        backgroundColor: _themeNotifier.backgroundColor,
        body: Stack(children: [
          Padding(
              padding: EdgeInsets.only(bottom: 80.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// LOGO IMAGE
                    Image.asset('assets/ic_logo.png'),
                    SizedBox(height: 36.0),

                    /// TITLE
                    Text('Inflation\nHedging\nCoin',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'NeoGramExtended',
                            fontSize: 48.0,
                            fontWeight: FontWeight.bold,
                            color: _themeNotifier.titleColor)),
                  ],
                ),
              )),
          Padding(
              padding: EdgeInsets.only(
                  left: 24.0, right: 24.0, bottom: padding.bottom + 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  /// CONNECT WALLET BUTTON
                  QZNGradientButtonWidget(
                      themeNotifier: _themeNotifier,
                      title: 'Connect Wallet',
                      isEnable: true,
                      onTap: () => {connectWalletDidTap()}),
                  SizedBox(height: 16.0),

                  /// CREATE WALLET BUTTON

                  CreateWalletButtonWidget(
                      themeNotifier: _themeNotifier,
                      title: 'Create Wallet',
                      isEnable: true,
                      onTap: () => {createWalletDidTap()})
                ],
              ))
        ]));
  }
}
