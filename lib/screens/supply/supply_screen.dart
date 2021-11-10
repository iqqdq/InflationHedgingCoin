// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/qzn_app_bar_widget.dart';
import 'package:inflation_hedging_coin/components/qzn_segmented_control_widget.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';
import 'package:inflation_hedging_coin/screens/supply/components/receive_item.dart';
import 'package:inflation_hedging_coin/screens/supply/components/supply_horizontal_list_item.dart';
import 'package:inflation_hedging_coin/screens/supply/components/supply_item.dart';

class SupplyScreenWidget extends StatefulWidget {
  const SupplyScreenWidget({Key? key}) : super(key: key);

  @override
  _SupplyScreenState createState() => _SupplyScreenState();
}

class _SupplyScreenState extends State<SupplyScreenWidget> {
  final _themeNotifier = ThemeNotifier();
  final _horizontalItems = [
    'Supplied balance',
    'Investment return',
    'Yield tokens balance',
    'Accrued interest'
  ];
  int _selectedTab = 0;

  // MARK: -
  // MARK: - ACTIONS

  void tabDidTap(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  void tokenDidTap(int index) {}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: QZNAppBarWidget(
          preferredSize: Size.fromHeight(80.0),
          themeNotifier: _themeNotifier,
          withBackButton: true,
          title: 'Inflation Hedging\nCoin',
        ),
        backgroundColor: _themeNotifier.backgroundColor,
        body: Stack(children: [
          ListView(
            children: [
              /// HORIZONTAL LIST
              Container(
                  margin: EdgeInsets.only(bottom: 24.0),
                  height: 86.0,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left: 24.0, right: 24.0),
                      itemCount: _horizontalItems.length,
                      itemBuilder: (context, index) {
                        return SupplyHorizontalListItemWidget(
                            themeNotifier: _themeNotifier,
                            index: index,
                            title: _horizontalItems[index],
                            isPercent: index == 1,
                            value: 0);
                      })),

              /// SEGMENTED CONTROL
              Container(
                  child: Align(
                      alignment: Alignment.center,
                      child: QZNSegmentedControlWidget(
                        themeNotifier: _themeNotifier,
                        width: size.width - 48.0,
                        titles: ['Supply', 'Remove'],
                        onTap: (index) => {tabDidTap(index)},
                      ))),

              /// SUPPLY
              SupplyItemWidget(
                  themeNotifier: _themeNotifier,
                  image: 'https://thefloppa.com/ihc.png',
                  name: 'IHC',
                  action: _selectedTab == 0 ? 'supply' : 'receive',
                  value: 150000,
                  balanceValue: 159000,
                  depositValue: 159000,
                  onMaxTap: () => {}),
              SizedBox(height: 22.0),
              Container(
                height: 24.0,
                child: Image.asset('assets/ic_arrow_down.png'),
              ),

              /// RECEIVE
              ReceiveItemWidget(
                  themeNotifier: _themeNotifier,
                  image: 'https://thefloppa.com/ihc.png',
                  name: 'IHC',
                  action: _selectedTab == 0 ? 'receive' : 'remove',
                  value: 150000,
                  apyValue: 0.02138,
                  rateValue: 6.16,
                  feeValue: 0.05),
              SizedBox(height: 40.0)
            ],
          ),
        ]));
  }
}
