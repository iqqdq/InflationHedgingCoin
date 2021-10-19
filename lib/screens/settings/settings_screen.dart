// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/gradient_text.dart';
import 'package:inflation_hedging_coin/components/qzn_app_bar.dart';
import 'package:inflation_hedging_coin/components/qzn_header_number_keyboard.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';
import 'package:inflation_hedging_coin/components/unfocus_widget.dart';
import 'package:inflation_hedging_coin/screens/settings/components/settings_input.dart';
import 'package:inflation_hedging_coin/screens/settings/components/settings_percent_button.dart';

class SettingsScreenWidget extends StatefulWidget {
  const SettingsScreenWidget({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreenWidget> {
  final _themeNotifier = ThemeNotifier();
  final _slippageTextEditingController = TextEditingController();
  final _slippageFocusNode = FocusNode();
  final _deadlineTextEditingController = TextEditingController();
  final _deadlineFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _slippageTextEditingController.text = '0.5';
    _deadlineTextEditingController.text = '20';
  }

  @override
  void dispose() {
    _slippageTextEditingController.dispose();
    _deadlineTextEditingController.dispose();
    super.dispose();
  }

  // MARK: -
  // MARK: - ACTIONS

  void saveDidTap() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: QZNAppBarWidget(
          preferredSize: Size.fromHeight(90.0),
          themeNotifier: _themeNotifier,
          title: 'Settings',
          withBackButton: true,
          action: GradientText(
            'Save',
            style: TextStyle(
                fontFamily: 'NeoGramExtended',
                fontSize: 16.0,
                fontWeight: FontWeight.w700),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  _themeNotifier.blueGradientColor,
                  _themeNotifier.pinkGradientColor,
                ]),
          ),
          onActionTap: () => {saveDidTap()},
        ),
        backgroundColor: _themeNotifier.backgroundColor,
        body: UnfocusWidget(
            child: SizedBox.expand(
                child: Stack(children: [
          ListView(
            padding: EdgeInsets.only(left: 24.0, right: 24.0, bottom: 40.0),
            children: [
              SettingsInputWidget(
                  themeNotifier: _themeNotifier,
                  title: 'Slippage Tolerance',
                  textEditingController: _slippageTextEditingController,
                  focusNode: _slippageFocusNode),
              SizedBox(height: 12.0),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SettingsPercentButton(
                    themeNotifier: _themeNotifier,
                    title: '0.1%',
                    onTap: () => {}),
                SizedBox(width: 16.0),
                SettingsPercentButton(
                    themeNotifier: _themeNotifier,
                    title: '0.5%',
                    onTap: () => {}),
                SizedBox(width: 16.0),
                SettingsPercentButton(
                    themeNotifier: _themeNotifier, title: '1%', onTap: () => {})
              ]),
              SizedBox(height: 20.0),
              SettingsInputWidget(
                  themeNotifier: _themeNotifier,
                  title: 'Transaction deadline',
                  textEditingController: _deadlineTextEditingController,
                  focusNode: _deadlineFocusNode)
            ],
          ),
          // DELETE
          Align(
              alignment: Alignment.bottomCenter,
              child: QZNHeaderNumberKeyboardWidget(
                  themeNotifier: _themeNotifier,
                  showKeyboard: true,
                  isEnterButtonEnabled: false,
                  enterButtonTitle: 'Enter amount',
                  feeUSDValue: r'$25 > 3 min',
                  feeValue: '0.00125 ETH',
                  totalValue: '120,500 IHC',
                  didTapKeyButton: (text) => {print(text)},
                  onEnterTap: () => {}))
        ]))));
  }
}
