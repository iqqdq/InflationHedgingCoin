// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inflation_hedging_coin/components/qzn_app_bar_widget.dart';
import 'package:inflation_hedging_coin/components/qzn_toast_widget.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';
import 'package:inflation_hedging_coin/components/transparent_route.dart';
import 'package:inflation_hedging_coin/screens/token_transaction/components/token_transaction_header.dart';
import 'package:inflation_hedging_coin/screens/token_transaction/components/token_transaction_list_item.dart';
import 'package:inflation_hedging_coin/screens/token_transaction/components/transaction_details_widget.dart';
import 'package:inflation_hedging_coin/screens/wallet/components/wallet_address_widget.dart';
import 'package:share/share.dart';

class TokenTransactionScreenWidget extends StatefulWidget {
  const TokenTransactionScreenWidget({Key? key}) : super(key: key);

  @override
  _TokenTransactionScreenState createState() => _TokenTransactionScreenState();
}

class _TokenTransactionScreenState extends State<TokenTransactionScreenWidget> {
  final _themeNotifier = ThemeNotifier();

  // MARK: -
  // MARK: - ACTIONS

  void receiveDidTap() {
    Navigator.of(context).push(TransparentRoute(
        builder: (BuildContext context) => WalletAddressWidget(
            themeNotifier: _themeNotifier,
            walletAddress: '0x490dbf7884b8e13c2161448b83dd2d8909db48ed')));
  }

  void sendDidTap() {}

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

  void shareDidTap() {
    Share.share(
        'My wallet address:\n0x490dbf7884b8e13c2161448b83dd2d8909db48ed');
  }

  void transactionDidTap(int index) {
    Navigator.of(context).push(TransparentRoute(
        builder: (BuildContext context) => TransactionDetailsWidget(
            themeNotifier: _themeNotifier,
            image: 'https://thefloppa.com/ihc.png',
            value: 120500,
            name: 'IHC',
            feeUSDvalue: 25.0,
            feeETHValue: 0.00125,
            status: 1,
            walletAddress: '0x490dbf7884b8e13c2161448b83dd2d8909db48ed',
            dateTime: DateTime.now(),
            onLinkTap: () => {viewOnEtherscanDidTap()})));
  }

  void viewOnEtherscanDidTap() {}

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: _themeNotifier.backgroundColor,
      appBar: QZNAppBarWidget(
        preferredSize: Size.fromHeight(80.0),
        themeNotifier: _themeNotifier,
        withBackButton: true,
        title: 'Inflation Hedging\nCoin',
      ),
      body: Stack(
        children: [
          Padding(
              padding: EdgeInsets.only(top: 312.0),
              child: ListView.builder(
                  padding:
                      EdgeInsets.only(top: padding.top + 12.0, bottom: 40.0),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return TokenTransactionListItemWidget(
                        themeNotifier: _themeNotifier,
                        status: index == 0
                            ? 0
                            : index == 1
                                ? 1
                                : 2,
                        image: 'https://thefloppa.com/ihc.png',
                        name: 'IHC',
                        value: 120500,
                        dateTime: DateTime.now(),
                        time: DateTime.now(),
                        showDate: index == 0,
                        onTap: () => {transactionDidTap(index)});
                  })),
          Padding(
              padding: EdgeInsets.only(left: 24.0, top: 136.0, right: 24.0),
              child: TokenTransactionHeaderWidget(
                  themeNotifier: _themeNotifier,
                  image: 'https://thefloppa.com/ihc.png',
                  name: 'IHC',
                  totalValue: 126753492,
                  onReceiveTap: () => {receiveDidTap()},
                  onSendTap: () => {sendDidTap()},
                  onCopyTap: () => {copyDidTap()})),
        ],
      ),
    );
  }
}
