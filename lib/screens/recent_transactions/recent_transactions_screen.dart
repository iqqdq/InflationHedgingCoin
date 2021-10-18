// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/qzn_app_bar.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';
import 'package:inflation_hedging_coin/components/unfocus_widget.dart';
import 'package:inflation_hedging_coin/screens/recent_transactions/components/recent_transaction_item.dart';

class RecentTransactionsScreenWidget extends StatefulWidget {
  const RecentTransactionsScreenWidget({Key? key}) : super(key: key);

  @override
  _RecentTransactionsScreenState createState() =>
      _RecentTransactionsScreenState();
}

class _RecentTransactionsScreenState
    extends State<RecentTransactionsScreenWidget> {
  final _themeNotifier = ThemeNotifier();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: QZNAppBarWidget(
          preferredSize: Size.fromHeight(90.0),
          themeNotifier: _themeNotifier,
          title: 'Recent\nTransactions',
          withBackButton: true,
        ),
        backgroundColor: _themeNotifier.backgroundColor,
        body: UnfocusWidget(
            child: SizedBox.expand(
                child: Stack(children: [
          ListView.builder(
              padding: EdgeInsets.only(
                  top: 20.0, left: 24.0, right: 24.0, bottom: 40.0),
              itemCount: 8,
              itemBuilder: (context, index) {
                return RecentTransactionListItemWidget(
                    themeNotifier: _themeNotifier,
                    showDate: index == 0,
                    fromImage:
                        'https://s2.coinmarketcap.com/static/img/coins/64x64/3349.png',
                    fromName: 'GPYX',
                    fromValue: 164353425,
                    toName: 'IHC',
                    toImage:
                        'https://s2.coinmarketcap.com/static/img/coins/64x64/3349.png',
                    toValue: 200,
                    dateTime: DateTime.now());
              })
        ]))));
  }
}
