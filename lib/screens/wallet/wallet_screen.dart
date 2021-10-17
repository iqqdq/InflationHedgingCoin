// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/qzn_toast.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';
import 'package:inflation_hedging_coin/screens/wallet/components/wallet_header.dart';
import 'package:inflation_hedging_coin/screens/wallet/components/wallet_list_item.dart';

class WalletScreenWidget extends StatefulWidget {
  const WalletScreenWidget({Key? key}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreenWidget> {
  final _themeNotifier = ThemeNotifier();
  bool _showToast = false;

  // MARK: -
  // MARK: - ACTIONS

  void receiveDidTap() {}

  void sendDidTap() {}

  void copyDidTap() {
    setState(() {
      _showToast = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;

    return Scaffold(
        backgroundColor: _themeNotifier.backgroundColor,
        body: SizedBox.expand(
            child: Stack(children: [
          Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(
                      left: 24.0, top: padding.top + 12.0, right: 24.0),
                  child: WalletHeaderWidget(
                      themeNotifier: _themeNotifier,
                      totalValue: 1345175,
                      onReceiveTap: () => {receiveDidTap()},
                      onSendTap: () => {sendDidTap()},
                      onCopyTap: () => {copyDidTap()})),
              Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.only(
                          left: 24.0, top: 32.0, right: 24.0, bottom: 100.0),
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return WalletListItemWidget(
                            themeNotifier: _themeNotifier,
                            image:
                                'https://s2.coinmarketcap.com/static/img/coins/64x64/3349.png',
                            name: 'GPYX',
                            value: 126753542,
                            onTap: () => {});
                      }))
            ],
          ),
          _showToast
              ? QZNToastWidget(
                  themeNotifier: _themeNotifier,
                  image: 'assets/ic_check.png',
                  text: 'Your address was copied successfully!',
                  timerDidStop: () => {
                        setState(() {
                          _showToast = false;
                        })
                      })
              : Container()
        ])));
  }
}
