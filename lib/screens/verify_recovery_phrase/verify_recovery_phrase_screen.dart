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
  int _currentIndex = 0;
  bool _isNotCorrect = false;

  @override
  void initState() {
    widget.words.forEach((word) {
      _words.add(word);
    });

    _words.shuffle();

    _words.forEach((element) {
      _selectedWords.add('');
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void check() {
    var i = 0;
    _selectedWords.forEach((selectedWord) {
      if (selectedWord != '') {
        _isNotCorrect = selectedWord != widget.words[i];
        i++;
      }
    });

    print(_currentIndex);
  }

  // MARK: -
  // MARK: - ACTIONS

  void wordDidTap(int index) {
    setState(() {
      _selectedWords[_currentIndex] = _words[index];
      _currentIndex = _currentIndex < _words.length - 1
          ? _currentIndex++
          : _words.length - 1;

      if (_currentIndex < _words.length - 1) _currentIndex++;

      check();
    });
  }

  void selectedWordDidTap(int index) {
    setState(() {
      _selectedWords[index] = '';

      if (_currentIndex > 0) _currentIndex--;
    });

    check();
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
                          constraints: BoxConstraints(minHeight: 220.0),
                          padding: EdgeInsets.only(
                              left: 18.0, top: 10.0, right: 18.0, bottom: 10.0),
                          color: _themeNotifier.recoveryPhraseBackground,
                          child: Tags(
                              itemCount: _selectedWords.length,
                              itemBuilder: (int index) {
                                return _selectedWords[index] != ''
                                    ? RecoveryTagWidget(
                                        themeNotifier: _themeNotifier,
                                        number: (index + 1).toString(),
                                        word: _selectedWords[index],
                                        isVisible: true,
                                        onTap: () =>
                                            {selectedWordDidTap(index)})
                                    : Container();
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
                                    isVisible:
                                        !_selectedWords.contains(_words[index]),
                                    onTap: () => {wordDidTap(index)});
                              }),
                        )
                      ])),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        children: [
                          /// WARNING MESSAGE
                          _isNotCorrect && _currentIndex > 0
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                      Image.asset('assets/ic_error.png'),
                                      SizedBox(width: 10.0),
                                      Text('Invalid order. Try again!',
                                          style: TextStyle(
                                              color:
                                                  _themeNotifier.warningColor,
                                              fontFamily: 'NeoGramExtended',
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold)),
                                    ])
                              : Container(),
                          SizedBox(height: 24.0),

                          /// CONTINUE BUTTON
                          QZNGradientButtonWidget(
                              themeNotifier: _themeNotifier,
                              title: 'Continue',
                              isEnable: !_isNotCorrect &&
                                  !_selectedWords.contains(''),
                              onTap: () => {continueDidTap()}),
                        ],
                      ))
                ],
              )),
        ]));
  }
}
