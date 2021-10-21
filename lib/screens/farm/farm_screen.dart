// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/qzn_app_bar.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';
import 'package:inflation_hedging_coin/components/unfocus_widget.dart';
import 'package:inflation_hedging_coin/screens/farm/components/farm_list_item.dart';

class FarmScreenWidget extends StatefulWidget {
  const FarmScreenWidget({Key? key}) : super(key: key);

  @override
  _FarmScreenState createState() => _FarmScreenState();
}

class _FarmScreenState extends State<FarmScreenWidget> {
  final _themeNotifier = ThemeNotifier();

  // MARK: -
  // MARK: - ACTIONS

  void selectDidTap(int index) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: QZNAppBarWidget(
          preferredSize: Size.fromHeight(100.0),
          themeNotifier: _themeNotifier,
          title: 'Farm',
          subtitle: 'Stake your LP tokens\nto receive IHCs',
        ),
        backgroundColor: _themeNotifier.backgroundColor,
        body: UnfocusWidget(
            child: SizedBox.expand(
                child: Stack(children: [
          ListView.builder(
              padding: EdgeInsets.only(
                  top: 170.0, left: 24.0, right: 24.0, bottom: 40.0),
              itemCount: 8,
              itemBuilder: (context, index) {
                return FarmListItemWidget(
                    themeNotifier: _themeNotifier,
                    image:
                        'https://s2.coinmarketcap.com/static/img/coins/64x64/3349.png',
                    title: 'IHC Pool',
                    depositName: 'IHC',
                    earnName: 'IHC',
                    apyPercent: 310,
                    onSelectTap: () => {selectDidTap(index)});
              }),
        ]))));
  }
}
