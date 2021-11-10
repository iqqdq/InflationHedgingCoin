import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/gradient_text_widget.dart';
import 'package:inflation_hedging_coin/components/qzn_app_bar_widget.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';
import 'package:inflation_hedging_coin/components/unfocus_widget.dart';
import 'package:inflation_hedging_coin/screens/borrow/components/borrow_list_item.dart';
import 'package:inflation_hedging_coin/screens/borrow/components/borrow_market_header.dart';
import 'package:inflation_hedging_coin/screens/borrow/components/borrow_net_apy.dart';
import 'package:inflation_hedging_coin/screens/borrow_modal_sheet/borrow_modal_sheet_screen.dart';
import 'package:inflation_hedging_coin/screens/supply_modal_sheet/supply_modal_sheet_screen.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class BorrowScreenWidget extends StatefulWidget {
  const BorrowScreenWidget({Key? key}) : super(key: key);

  @override
  _BorrowScreenState createState() => _BorrowScreenState();
}

class _BorrowScreenState extends State<BorrowScreenWidget> {
  final _themeNotifier = ThemeNotifier();

  // MARK: -
  // MARK: - ACTIONS

  void supplySwitchDidTap() {
    showMaterialModalBottomSheet(
        barrierColor: Colors.black.withOpacity(0.5),
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => SupplyModalSheetWidget());
  }

  void borrowSwitchDidTap() {
    showMaterialModalBottomSheet(
        barrierColor: Colors.black.withOpacity(0.5),
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => BorrowModalSheetWidget());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: QZNAppBarWidget(
          preferredSize: Size.fromHeight(80.0),
          themeNotifier: _themeNotifier,
          title: 'Loan',
          subtitle: 'Borrow and save your tokens',
        ),
        backgroundColor: _themeNotifier.backgroundColor,
        body: UnfocusWidget(
            child: SizedBox.expand(
                child: Stack(children: [
          ListView(
            padding: EdgeInsets.only(
                left: 24.0, top: 24.0, right: 24.0, bottom: 120.0),
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Supply Balance',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14.0,
                            color: _themeNotifier.placeholderColor)),
                    SizedBox(height: 8.0),

                    /// SUPPLY BALANCE
                    GradientTextWidget(
                      r'$120',
                      style: TextStyle(
                          fontFamily: 'NeoGramExtended',
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            _themeNotifier.lightGreenGradientColor,
                            _themeNotifier.greenGradientColor,
                          ]),
                    ),
                    SizedBox(height: 24.0),
                    Text('Borrow Balance',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14.0,
                            color: _themeNotifier.placeholderColor)),
                    SizedBox(height: 8.0),

                    /// BORROW BALANCE
                    GradientTextWidget(
                      r'$0',
                      style: TextStyle(
                          fontFamily: 'NeoGramExtended',
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            _themeNotifier.orangeGradientColor,
                            _themeNotifier.lightOrangeGradientColor,
                          ]),
                    ),
                  ],
                ),

                /// NET APY
                Padding(
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: BorrowNetApyWidget(
                      themeNotifier: _themeNotifier, value: 3.8),
                )
              ]),
              SizedBox(height: 32.0),
              Text('Supply Markets',
                  style: TextStyle(
                      fontFamily: 'NeoGramExtended',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: _themeNotifier.titleColor)),
              SizedBox(height: 24.0),
              BorrowMarketHeaderWidget(
                  themeNotifier: _themeNotifier,
                  titles: ['Asset', 'APY', 'Collateral']),

              /// SUPPLY MARKETS
              Container(
                  height: (88.0 + 16.0) * 4,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(top: 18.0),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return BorrowListItemWidget(
                            themeNotifier: _themeNotifier,
                            image: 'https://thefloppa.com/ihc.png',
                            name: 'IHC',
                            percentValue: 90.93,
                            balanceValue: 143455549,
                            switchState: false,
                            onSwitchTap: (isOn) {
                              if (isOn) supplySwitchDidTap();
                            });
                      })),
              SizedBox(height: 32.0),
              Text('Borrow Markets',
                  style: TextStyle(
                      fontFamily: 'NeoGramExtended',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: _themeNotifier.titleColor)),
              SizedBox(height: 24.0),
              BorrowMarketHeaderWidget(
                  themeNotifier: _themeNotifier,
                  titles: ['Asset', 'APY', 'Liquidity']),

              /// BORROW MARKETS
              Container(
                  height: (88.0 + 16.0) * 4,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(top: 18.0),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return BorrowListItemWidget(
                            themeNotifier: _themeNotifier,
                            image: 'https://thefloppa.com/ihc.png',
                            name: 'IHC',
                            percentValue: 90.93,
                            balanceValue: 143455549,
                            switchState: false,
                            onSwitchTap: (isOn) {
                              if (isOn) borrowSwitchDidTap();
                            });
                      })),
            ],
          ),
        ]))));
  }
}
