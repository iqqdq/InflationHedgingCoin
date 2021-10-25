// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_tags/flutter_tags.dart';
import 'package:inflation_hedging_coin/components/gradient_text_widget.dart';
import 'package:inflation_hedging_coin/components/qzn_app_bar_widget.dart';
import 'package:inflation_hedging_coin/components/qzn_gradient_button_widget.dart';
import 'package:inflation_hedging_coin/components/recovery_word_widget.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';
import 'package:inflation_hedging_coin/screens/verify_recovery_phrase/verify_recovery_phrase_screen.dart';
import 'package:inflation_hedging_coin/screens/your_recovery_phrase/components/copy_button_widget.dart';
import 'package:inflation_hedging_coin/screens/your_recovery_phrase/components/warning_widget.dart';
import 'package:share/share.dart';

class YourRecoveryPhraseScreenWidget extends StatefulWidget {
  const YourRecoveryPhraseScreenWidget({Key? key}) : super(key: key);

  @override
  _YourRecoveryPhraseScreenState createState() =>
      _YourRecoveryPhraseScreenState();
}

class _YourRecoveryPhraseScreenState
    extends State<YourRecoveryPhraseScreenWidget> {
  final _themeNotifier = ThemeNotifier();
  List<String> _words = [
    'weekend',
    'certain',
    'quality',
    'fit',
    'correct',
    'tourist',
    'slogan',
    'final',
    'history',
    'squirrel',
    'jelly',
    'liar'
  ];

  // MARK: -
  // MARK: - ACTIONS

  void copyDidTap() {
    Share.share(_words.toString().replaceAll('[', '').replaceAll(']', ''));
  }

  void continueDidTap() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                VerifyRecoveryPhraseScreenWidget(words: _words)));
  }

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;

    return Scaffold(
        appBar: QZNAppBarWidget(
            preferredSize: Size.fromHeight(80.0),
            themeNotifier: _themeNotifier,
            withBackButton: true,
            title: 'Your recovery\nphrase'),
        backgroundColor: _themeNotifier.backgroundColor,
        body: Stack(children: [
          Padding(
              padding:
                  EdgeInsets.only(top: 24.0, bottom: padding.bottom + 12.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GradientTextWidget(
                      'Write down or copy these\nwords in the right order and\nsave them somewhere safe',
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
                    Column(
                      children: [
                        /// TAGS
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.0),
                          child: Tags(
                              itemCount: _words.length,
                              itemBuilder: (int index) {
                                return IgnorePointer(
                                    child: RecoveryTagWidget(
                                        themeNotifier: _themeNotifier,
                                        number: (index + 1).toString(),
                                        word: _words[index],
                                        isVisible: true,
                                        onTap: () => {print(index)}));
                              }),
                        ),
                        SizedBox(height: 30.0),

                        /// COPY BUTTON
                        Align(
                            alignment: Alignment.center,
                            child: FittedBox(
                              child: CopyButtonWidget(
                                  themeNotifier: _themeNotifier,
                                  onTap: () => {copyDidTap()}),
                            ))
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          children: [
                            WarningWidget(themeNotifier: _themeNotifier),
                            SizedBox(height: 16.0),

                            /// CONTINUE BUTTON
                            QZNGradientButtonWidget(
                                themeNotifier: _themeNotifier,
                                title: 'Continue',
                                isEnable: true,
                                onTap: () => {continueDidTap()}),
                          ],
                        ))
                  ]))
        ]));
  }
}
