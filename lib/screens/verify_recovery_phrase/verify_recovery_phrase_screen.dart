import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_tags/flutter_tags.dart';
import 'package:inflation_hedging_coin/components/gradient_text_widget.dart';
import 'package:inflation_hedging_coin/components/qzn_app_bar_widget.dart';
import 'package:inflation_hedging_coin/components/qzn_gradient_button_widget.dart';
import 'package:inflation_hedging_coin/components/recovery_word_widget.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';
import 'package:inflation_hedging_coin/screens/tab_controller/tab_controller_screen.dart';

class VerifyRecoveryPhraseScreenWidget extends StatefulWidget {
  final List<String> words;

  const VerifyRecoveryPhraseScreenWidget({Key? key, required this.words})
      : super(key: key);

  @override
  _VerifyRecoveryPhraseScreenState createState() =>
      _VerifyRecoveryPhraseScreenState();
}

class _VerifyRecoveryPhraseScreenState
    extends State<VerifyRecoveryPhraseScreenWidget> {
  final _themeNotifier = ThemeNotifier();
  List<String> _words = [];
  List<String> _selectedWords = [];

  @override
  void initState() {
    super.initState();

    setState(() {
      _words = widget.words;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  // MARK: -
  // MARK: - ACTIONS

  void wordDidTap(int index) {
    setState(() {
      _selectedWords.add(_words[index]);
    });
  }

  void selectedWordDidTap(int index) {
    setState(() {
      _selectedWords.removeAt(index);
    });
  }

  void continueDidTap() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) =>
                TabControllerScreenWidget(showWalletWasCreatedAlert: true)),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;

    return Scaffold(
        appBar: QZNAppBarWidget(
            preferredSize: Size.fromHeight(80.0),
            themeNotifier: _themeNotifier,
            withBackButton: true,
            title: 'Verify recovery\nphrase'),
        backgroundColor: _themeNotifier.backgroundColor,
        body: Stack(children: [
          Padding(
              padding:
                  EdgeInsets.only(top: 24.0, bottom: padding.bottom + 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GradientTextWidget(
                    'Tap the words to put them next\nto each other in the correct order',
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
                  Expanded(
                      child: ListView(
                          padding: EdgeInsets.only(top: 26.0),
                          children: [
                        /// SELECTED TAGS
                        Container(
                          constraints: BoxConstraints(minHeight: 178.0),
                          padding: EdgeInsets.only(
                              left: 18.0, top: 10.0, right: 18.0, bottom: 10.0),
                          color: _themeNotifier.recoveryPhraseBackground,
                          child: Tags(
                              itemCount: _selectedWords.length,
                              itemBuilder: (int index) {
                                return RecoveryTagWidget(
                                    themeNotifier: _themeNotifier,
                                    number: (index + 1).toString(),
                                    word: _selectedWords[index],
                                    isVisible: true,
                                    onTap: () => {selectedWordDidTap(index)});
                              }),
                        ),
                        SizedBox(height: 24.0),

                        /// TAGS
                        Padding(
                          padding: EdgeInsets.only(left: 18.0, right: 18.0),
                          child: Tags(
                              itemCount: _words.length,
                              itemBuilder: (int index) {
                                return RecoveryTagWidget(
                                    themeNotifier: _themeNotifier,
                                    word: _words[index],
                                    isVisible: true,
                                    onTap: () => {wordDidTap(index)});
                              }),
                        )
                      ])),

                  /// CONTINUE BUTTON
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: QZNGradientButtonWidget(
                        themeNotifier: _themeNotifier,
                        title: 'Continue',
                        isEnable: true,
                        onTap: () => {continueDidTap()}),
                  )
                ],
              )),
        ]));
  }
}
