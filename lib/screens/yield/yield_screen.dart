// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/qzn_app_bar_widget.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';
import 'package:inflation_hedging_coin/screens/supply/supply_screen.dart';
import 'package:inflation_hedging_coin/screens/yield/components/yield_horizontal_list_item.dart';
import 'package:inflation_hedging_coin/screens/yield/components/yield_list_item.dart';
import 'package:inflation_hedging_coin/screens/yield/components/yield_sort_widget.dart';

class YieldScreenWidget extends StatefulWidget {
  const YieldScreenWidget({Key? key}) : super(key: key);

  @override
  _YieldScreenState createState() => _YieldScreenState();
}

class _YieldScreenState extends State<YieldScreenWidget> {
  final _themeNotifier = ThemeNotifier();
  final _horizontalItems = ['Total Value Invested', 'Average APY'];
  int _selectedTab = 0;

  // MARK: -
  // MARK: - ACTIONS

  void horizontalItemDidTap(int index) {}

  void tabDidTap(int index) {
    setState(() {
      _selectedTab = index;
    });
    print(_selectedTab);
  }

  void tokenDidTap(int index) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SupplyScreenWidget()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: QZNAppBarWidget(
          preferredSize: Size.fromHeight(80.0),
          themeNotifier: _themeNotifier,
          title: 'Yield',
          subtitle: 'Earning interest on Yield Tokens',
        ),
        backgroundColor: _themeNotifier.backgroundColor,
        body: SizedBox.expand(
            child: Stack(children: [
          Column(
            children: [
              /// HORIZONTAL LIST
              Container(
                  margin: EdgeInsets.only(top: 142.0, bottom: 24.0),
                  height: 82.0,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left: 24.0, right: 12.0),
                      itemCount: _horizontalItems.length,
                      itemBuilder: (context, index) {
                        return YieldHorizontalListItemWidget(
                            themeNotifier: _themeNotifier,
                            title: _horizontalItems[index],
                            isPercent: index == 1,
                            value: index == 1 ? 3 : 329500,
                            onTap: () => {horizontalItemDidTap(index)});
                      })),

              /// TABS
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: YieldSortItemWidget(
                      themeNotifier: _themeNotifier,
                      selectedIndex: _selectedTab,
                      onTap: (index) => {tabDidTap(index)})),

              /// LIST
              Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.only(
                          left: 24.0, top: 24.0, right: 24.0, bottom: 100.0),
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return YieldListItemWidget(
                            themeNotifier: _themeNotifier,
                            image:
                                'https://s2.coinmarketcap.com/static/img/coins/64x64/3349.png',
                            name: 'IHC',
                            percentValue: 2.83,
                            usdValue: 810700000,
                            onTap: () => {tokenDidTap(index)});
                      }))
            ],
          ),
        ])));
  }
}
