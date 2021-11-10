// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/qzn_app_bar_widget.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';
import 'package:inflation_hedging_coin/screens/connecting_wallet/connecting_wallet.dart';
import 'package:inflation_hedging_coin/screens/recovery_phrase/recovery_phrase.dart';
import 'package:inflation_hedging_coin/screens/wallet_connect/components/recovery_phrase_button_widget.dart';
import 'package:inflation_hedging_coin/screens/wallet_connect/components/wallet_connect_list_item.dart';

class WalletConnectScreenWidget extends StatefulWidget {
  const WalletConnectScreenWidget({Key? key}) : super(key: key);

  @override
  _WalletConnectScreenState createState() => _WalletConnectScreenState();
}

class _WalletConnectScreenState extends State<WalletConnectScreenWidget> {
  final _themeNotifier = ThemeNotifier();

  // MARK: -
  // MARK: - ACTIONS

  void enterRecoveryPhraseDidTap() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => RecoveryPhraseScreenWidget()));
  }

  void walletDidTap(int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ConnectingWalletScreenWidget(title: 'Rainbow', image: '')));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;

    return Scaffold(
        appBar: QZNAppBarWidget(
            preferredSize: Size.fromHeight(80.0),
            themeNotifier: _themeNotifier,
            withBackButton: true,
            title: 'Connect Wallet'),
        backgroundColor: _themeNotifier.backgroundColor,
        body: Stack(children: [
          Padding(
              padding: EdgeInsets.only(
                  bottom: padding.bottom + 12.0, left: 24.0, right: 24.0),
              child: Column(children: [
                Image.asset('assets/ic_key_safe.png',
                    height: size.height * 0.35, fit: BoxFit.fitHeight),
                RecoveryPhraseButtonWidget(
                    themeNotifier: _themeNotifier,
                    onTap: () => {enterRecoveryPhraseDidTap()}),
                SizedBox(height: 22.0),

                /// WALLET LISTVIEW
                Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            color: _themeNotifier.tableColor,
                            border: Border.all(
                                width: 1.0, color: _themeNotifier.outlineColor),
                            borderRadius: BorderRadius.circular(24.0),
                            boxShadow: [
                              BoxShadow(
                                  color: _themeNotifier.shadowColor,
                                  blurRadius: 16.0,
                                  offset: Offset(0, 24))
                            ]),
                        child: ListView.builder(
                            padding: EdgeInsets.all(16.0),
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return WalletConnectListItemWidget(
                                  themeNotifier: _themeNotifier,
                                  image: 'https://thefloppa.com/ihc.png',
                                  name: 'Rainbow',
                                  onTap: () => {walletDidTap(index)});
                            })))
              ])),
        ]));
  }
}
