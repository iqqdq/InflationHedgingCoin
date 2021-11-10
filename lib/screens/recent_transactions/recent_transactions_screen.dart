// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/qzn_app_bar_widget.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';
import 'package:inflation_hedging_coin/components/transparent_route.dart';
import 'package:inflation_hedging_coin/components/unfocus_widget.dart';
import 'package:inflation_hedging_coin/screens/recent_transactions/components/recent_transaction_item.dart';
import 'package:inflation_hedging_coin/screens/recent_transactions/components/swap_details.dart';

class RecentTransactionsScreenWidget extends StatefulWidget {
  const RecentTransactionsScreenWidget({Key? key}) : super(key: key);

  @override
  _RecentTransactionsScreenState createState() =>
      _RecentTransactionsScreenState();
}

class _RecentTransactionsScreenState
    extends State<RecentTransactionsScreenWidget> {
  final _themeNotifier = ThemeNotifier();

  // MARK: -
  // MARK: - FUNCTIONS

  void showSwapDetails() {
    Navigator.of(context).push(TransparentRoute(
        builder: (BuildContext context) => SwapDetailsWidget(
            themeNotifier: _themeNotifier,
            fromImage: 'https://thefloppa.com/ihc.png',
            fromValue: 150000,
            fromName: 'IHC',
            toImage: 'https://thefloppa.com/ihc.png',
            toValue: 10500,
            toName: 'IHC',
            feeUSDValue: 25,
            feeETHValue: 0.00125,
            status: 0,
            dateTime: DateTime.now(),
            link: 'link')));
  }

  // MARK: -
  // MARK: - ACTIONS

  void itemDidTap(int index) {
    Navigator.of(context).push(TransparentRoute(
        builder: (BuildContext context) => SwapDetailsWidget(
            themeNotifier: _themeNotifier,
            fromImage: 'https://thefloppa.com/ihc.png',
            fromValue: 150000,
            fromName: 'IHC',
            toImage: 'https://thefloppa.com/ihc.png',
            toValue: 10500,
            toName: 'IHC',
            feeUSDValue: 25,
            feeETHValue: 0.00125,
            status: 0,
            dateTime: DateTime.now(),
            link: 'link')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: QZNAppBarWidget(
          preferredSize: Size.fromHeight(80.0),
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
                  top: 140.0, left: 24.0, right: 24.0, bottom: 40.0),
              itemCount: 8,
              itemBuilder: (context, index) {
                return RecentTransactionListItemWidget(
                    themeNotifier: _themeNotifier,
                    showDate: index == 0,
                    fromImage: 'https://thefloppa.com/ihc.png',
                    fromName: 'IHC',
                    fromValue: 164353425,
                    toName: 'IHC',
                    toImage: 'https://thefloppa.com/ihc.png',
                    toValue: 200,
                    dateTime: DateTime.now(),
                    onTap: () => itemDidTap(index));
              })
        ]))));
  }
}
