// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/gradient_text_widget.dart';
import 'package:inflation_hedging_coin/components/qzn_app_bar_widget.dart';
import 'package:inflation_hedging_coin/components/qzn_gradient_button_widget.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';
import 'package:inflation_hedging_coin/screens/back_up/components/checkbox_widget.dart';
import 'package:inflation_hedging_coin/screens/your_recovery_phrase/your_recovery_phrase_screen.dart';

class BackUpScreenWidget extends StatefulWidget {
  const BackUpScreenWidget({Key? key}) : super(key: key);

  @override
  _BackUpScreenState createState() => _BackUpScreenState();
}

class _BackUpScreenState extends State<BackUpScreenWidget> {
  final _themeNotifier = ThemeNotifier();
  bool _isCheckboxSelected = false;

  // MARK: -
  // MARK: - ACTIONS

  void checkboxDidTap() {
    setState(() {
      _isCheckboxSelected = !_isCheckboxSelected;
    });
  }

  void continueDidTap() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => YourRecoveryPhraseScreenWidget()));
  }

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;

    return Scaffold(
        appBar: QZNAppBarWidget(
            preferredSize: Size.fromHeight(80.0),
            themeNotifier: _themeNotifier,
            withBackButton: true,
            title: 'Back up your\nwallet now!'),
        backgroundColor: _themeNotifier.backgroundColor,
        body: Stack(children: [
          Padding(
              padding: EdgeInsets.only(
                  top: 35.0,
                  bottom: padding.bottom + 12.0,
                  left: 24.0,
                  right: 24.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GradientTextWidget(
                      'In the next step you will\nsee 12 words that wllows\nyou to recover a wallet',
                      style: TextStyle(
                          fontFamily: 'NeoGramExtended',
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            _themeNotifier.blueGradientColor,
                            _themeNotifier.pinkGradientColor,
                          ]),
                    ),
                    Image.asset('assets/ic_safe.png'),
                    Column(
                      children: [
                        InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () => checkboxDidTap(),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CheckboxWidget(
                                  themeNotifier: _themeNotifier,
                                  isSelected: _isCheckboxSelected,
                                  onTap: () => {checkboxDidTap()}),
                              SizedBox(width: 14.0),
                              Text(
                                  'I understand that if I lose my recovery words,\nI will not be able to access my wallet',
                                  style: TextStyle(
                                      color: _themeNotifier.textColor,
                                      fontFamily: 'Poppins',
                                      fontSize: 12.0)),
                            ],
                          ),
                        ),
                        SizedBox(height: 27.0),
                        QZNGradientButtonWidget(
                            themeNotifier: _themeNotifier,
                            title: 'Continue',
                            isEnable: _isCheckboxSelected,
                            onTap: () => {continueDidTap()}),
                      ],
                    )
                  ]))
        ]));
  }
}
