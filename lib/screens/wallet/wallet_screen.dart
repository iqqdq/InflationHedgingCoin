// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inflation_hedging_coin/components/qzn_toast_widget.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';
import 'package:inflation_hedging_coin/components/transparent_route.dart';
import 'package:inflation_hedging_coin/screens/send_modal_sheet/send_modal_sheet_screen.dart';
import 'package:inflation_hedging_coin/screens/token_transaction/token_transaction_screen.dart';
import 'package:inflation_hedging_coin/screens/wallet/components/wallet_address_widget.dart';
import 'package:inflation_hedging_coin/screens/wallet/components/wallet_header_widget.dart';
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

  @override
  void initState() {
    super.initState();
  }

  // MARK: -
  // MARK: - ACTIONS

  void receiveDidTap() {
    Navigator.of(context).push(TransparentRoute(
        builder: (BuildContext context) => WalletAddressWidget(
            themeNotifier: _themeNotifier,
            walletAddress: '0x490dbf7884b8e13c2161448b83dd2d8909db48ed')));
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
    Clipboard.setData(new ClipboardData(
            text: '0x490dbf7884b8e13c2161448b83dd2d8909db48ed'))
        .then((_) {
      Navigator.of(context).push(TransparentRoute(
          builder: (BuildContext context) => QZNToastWidget(
              themeNotifier: _themeNotifier,
              image: 'assets/ic_check.png',
              text: 'Your address was copied successfully!')));
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
        body: Stack(
          children: [
            /// LIST
            Padding(
                padding: EdgeInsets.only(top: 232.0),
                child: ListView.builder(
                    padding: EdgeInsets.only(top: 44.0, bottom: 100.0),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return WalletListItemWidget(
                          themeNotifier: _themeNotifier,
                          image: 'https://thefloppa.com/ihc.png',
                          name: 'IHC',
                          value: 126753542,
                          onTap: () => {tokenDidTap(index)});
                    })),

            /// HEADER
            Padding(
                padding: EdgeInsets.only(
                    left: 24.0, top: padding.top + 12.0, right: 24.0),
                child: WalletHeaderWidget(
                    themeNotifier: _themeNotifier,
                    totalValue: 12324,
                    onReceiveTap: () => {receiveDidTap()},
                    onSendTap: () => {sendDidTap()},
                    onCopyTap: () => {copyDidTap()})),
          ],
        ));
  }
}
