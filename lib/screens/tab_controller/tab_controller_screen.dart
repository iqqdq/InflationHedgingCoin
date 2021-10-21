import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/tab_button.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';
import 'package:inflation_hedging_coin/screens/borrow/borrow_screen.dart';
import 'package:inflation_hedging_coin/screens/farm/farm_screen.dart';
import 'package:inflation_hedging_coin/screens/swap/swap_screen.dart';
import 'package:inflation_hedging_coin/screens/wallet/wallet_screen.dart';

class TabControllerScreenWidget extends StatefulWidget {
  const TabControllerScreenWidget({Key? key}) : super(key: key);

  @override
  _TabControllerScreenState createState() => _TabControllerScreenState();
}

class _TabControllerScreenState extends State<TabControllerScreenWidget> {
  final PageController _pageController = PageController();
  final _themeNotifier = ThemeNotifier();
  late List<Widget> _listScreens;
  int _index = 0;

  @override
  void initState() {
    _listScreens = [
      WalletScreenWidget(),
      SwapScreenWidget(),
      BorrowScreenWidget(),
      FarmScreenWidget()
    ];

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // MARK: -
  // MARK: - ACTIONS

  void didSelectTab(int index) {
    setState(() {
      _index = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _padding = MediaQuery.of(context).padding;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: _themeNotifier.backgroundColor,
        body: Stack(
          children: [
            SizedBox.expand(
              child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() => _index = index);
                  },
                  children: _listScreens),
            ),
            SizedBox.expand(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            height: 1.0, color: _themeNotifier.outlineColor),
                        Container(
                            padding: EdgeInsets.only(bottom: _padding.bottom),
                            color: _themeNotifier.tableColor,
                            child: Container(
                                padding: EdgeInsets.only(top: 12.0),
                                constraints: BoxConstraints(
                                    maxHeight: 87.0 - _padding.bottom),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TabButtonWidget(
                                      isSelected: _index == 0,
                                      image: 'assets/ic_tab_wallet.png',
                                      selectedImage:
                                          'assets/ic_tab_wallet_selected.png',
                                      onTap: () => {didSelectTab(0)},
                                    ),
                                    TabButtonWidget(
                                      isSelected: _index == 1,
                                      image: 'assets/ic_tab_swap.png',
                                      selectedImage:
                                          'assets/ic_tab_swap_selected.png',
                                      onTap: () => {didSelectTab(1)},
                                    ),
                                    TabButtonWidget(
                                      isSelected: _index == 2,
                                      image: 'assets/ic_tab_borrow.png',
                                      selectedImage:
                                          'assets/ic_tab_borrow_selected.png',
                                      onTap: () => {didSelectTab(2)},
                                    ),
                                    TabButtonWidget(
                                      isSelected: _index == 3,
                                      image: 'assets/ic_tab_yield.png',
                                      selectedImage:
                                          'assets/ic_tab_yield_selected.png',
                                      onTap: () => {didSelectTab(3)},
                                    ),
                                    TabButtonWidget(
                                      isSelected: _index == 4,
                                      image: 'assets/ic_tab_farm.png',
                                      selectedImage:
                                          'assets/ic_tab_farm_selected.png',
                                      onTap: () => {didSelectTab(4)},
                                    ),
                                  ],
                                )))
                      ],
                    ))),
          ],
        ));
  }
}
