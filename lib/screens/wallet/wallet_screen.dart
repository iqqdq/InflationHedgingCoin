// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/qzn_toast_widget.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';
import 'package:inflation_hedging_coin/screens/send_modal_sheet/send_modal_sheet_screen.dart';
import 'package:inflation_hedging_coin/screens/token_transaction/token_transaction_screen.dart';
import 'package:inflation_hedging_coin/screens/wallet/components/wallet_address.dart';
import 'package:inflation_hedging_coin/screens/wallet/components/wallet_header.dart';
import 'package:inflation_hedging_coin/screens/wallet/components/wallet_list_item.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:share/share.dart';

class WalletScreenWidget extends StatefulWidget {
  const WalletScreenWidget({Key? key}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreenWidget> {
  final _themeNotifier = ThemeNotifier();
  bool _showToast = false;
  bool _showReceive = false;

  // MARK: -
  // MARK: - ACTIONS

  void receiveDidTap() {
    setState(() {
      _showReceive = true;
    });
  }

  void sendDidTap() {
    showMaterialModalBottomSheet(
        barrierColor: Colors.black.withOpacity(0.5),
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => SendModalSheetWidget());
  }

  void shareDidTap() {
    Share.share(
        'My wallet address:\n0x490dbf7884b8e13c2161448b83dd2d8909db48ed');
  }

  void copyDidTap() {
    setState(() {
      _showToast = true;
    });
  }

  void tokenDidTap(int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TokenTransactionScreenWidget()));
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
                      totalValue: 13451752,
                      onReceiveTap: () => {receiveDidTap()},
                      onSendTap: () => {sendDidTap()},
                      onCopyTap: () => {copyDidTap()})),
              Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.only(top: 32.0, bottom: 100.0),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return WalletListItemWidget(
                            themeNotifier: _themeNotifier,
                            image:
                                'https://s2.coinmarketcap.com/static/img/coins/64x64/3349.png',
                            name: 'GPYX',
                            value: 126753542,
                            onTap: () => {tokenDidTap(index)});
                      }))
            ],
          ),
          _showReceive
              ? WalletAddressWidget(
                  themeNotifier: _themeNotifier,
                  walletAddress: '0x490dbf7884b8e13c2161448b83dd2d8909db48ed',
                  qrData: '0x490dbf7884b8e13c2161448b83dd2d8909db48ed',
                  onShareTap: () => {shareDidTap()},
                  onCopyTap: () => {copyDidTap()},
                  onCloseTap: () => {
                        setState(() {
                          _showReceive = false;
                        })
                      })
              : Container(),
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
