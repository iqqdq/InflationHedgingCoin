// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/qzn_app_bar_widget.dart';
import 'package:inflation_hedging_coin/components/qzn_gradient_button_widget.dart';
import 'package:inflation_hedging_coin/components/row_image_button_widget.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';
import 'package:inflation_hedging_coin/components/pointer_widget.dart';
import 'package:inflation_hedging_coin/components/unfocus_widget.dart';
import 'package:inflation_hedging_coin/screens/recent_transactions/recent_transactions_screen.dart';
import 'package:inflation_hedging_coin/screens/settings/settings_screen.dart';
import 'package:inflation_hedging_coin/screens/swap/components/swap_input.dart';
import 'package:inflation_hedging_coin/screens/token_selection/token_selection_screen.dart';

class SwapScreenWidget extends StatefulWidget {
  const SwapScreenWidget({Key? key}) : super(key: key);

  @override
  _SwapScreenState createState() => _SwapScreenState();
}

class _SwapScreenState extends State<SwapScreenWidget> {
  final _themeNotifier = ThemeNotifier();
  final _fromTextEditingController = TextEditingController();
  final _fromFocusNode = FocusNode();
  final _toTextEditingController = TextEditingController();
  final _toFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _fromTextEditingController.dispose();
    _toTextEditingController.dispose();
    super.dispose();
  }

  // MARK: -
  // MARK: - ACTIONS

  void confirmDidTap() {}

  void selectTokenDidTap(int index) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => TokenSelectionScreenWidget()));
  }

  void recentDidTap() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => RecentTransactionsScreenWidget()));
  }

  void settingsDidTap() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => SettingsScreenWidget()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: QZNAppBarWidget(
          preferredSize: Size.fromHeight(80.0),
          themeNotifier: _themeNotifier,
          title: 'Swap',
          subtitle: 'Trade tokens in an instant',
        ),
        backgroundColor: _themeNotifier.backgroundColor,
        body: UnfocusWidget(
            child: SizedBox.expand(
                child: Stack(children: [
          ListView(
            padding: EdgeInsets.only(left: 24.0, right: 24.0, bottom: 120.0),
            children: [
              /// FROM INPUT
              SwapInputWidget(
                  themeNotifier: _themeNotifier,
                  textEditingController: _fromTextEditingController,
                  focusNode: _fromFocusNode,
                  title: 'From',
                  onTokenTap: () => {selectTokenDidTap(0)}),
              Align(
                  alignment: Alignment.center,
                  child: PointerWidget(themeNotifier: _themeNotifier)),

              /// TO INPUT
              SwapInputWidget(
                  themeNotifier: _themeNotifier,
                  textEditingController: _toTextEditingController,
                  focusNode: _toFocusNode,
                  title: 'To',
                  name: 'IHC',
                  image: 'https://thefloppa.com/ihc.png',
                  onTokenTap: () => {selectTokenDidTap(1)}),
              SizedBox(height: 20.0),

              /// SWAP BUTTON
              QZNGradientButtonWidget(
                  themeNotifier: _themeNotifier,
                  title: 'Enter amount',
                  isEnable: false,
                  onTap: () => {confirmDidTap()}),
              SizedBox(height: 24.0),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text('Slippage Tolerance',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  color: _themeNotifier.placeholderColor))),
                      Text('0.5%',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: _themeNotifier.placeholderColor))
                    ],
                  )),
              SizedBox(height: 14.0),

              /// SETTINGS BUTTON
              RowImageButtonWidget(
                  themeNotifier: _themeNotifier,
                  title: 'Settings',
                  image: 'assets/ic_settings.png',
                  onTap: () => {settingsDidTap()}),

              /// RECENT BUTTON
              RowImageButtonWidget(
                  themeNotifier: _themeNotifier,
                  title: 'Recent transactions',
                  image: 'assets/ic_recent.png',
                  onTap: () => {recentDidTap()})
            ],
          ),
        ]))));
  }
}
