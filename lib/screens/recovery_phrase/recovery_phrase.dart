import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:inflation_hedging_coin/components/gradient_text_widget.dart';
import 'package:inflation_hedging_coin/components/qzn_app_bar_widget.dart';
import 'package:inflation_hedging_coin/components/qzn_gradient_button_widget.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';
import 'package:inflation_hedging_coin/components/unfocus_widget.dart';
import 'package:inflation_hedging_coin/screens/recovery_phrase/components/recovery_gradient_tag_widget.dart';
import 'package:inflation_hedging_coin/screens/tab_controller/tab_controller_screen.dart';
import 'package:material_tag_editor/tag_editor.dart';

class RecoveryPhraseScreenWidget extends StatefulWidget {
  const RecoveryPhraseScreenWidget({Key? key}) : super(key: key);

  @override
  _RecoveryPhraseScreenState createState() => _RecoveryPhraseScreenState();
}

class _RecoveryPhraseScreenState extends State<RecoveryPhraseScreenWidget> {
  final _themeNotifier = ThemeNotifier();
  final _focusNote = FocusNode();
  List<String> _words = [];
  bool _isContinueButtonEnabled = false;

  // MARK: -
  // MARK: - FUNCTIONS

  void onTagAdd(String tag) {
    setState(() {
      _words.add(tag);
      _isContinueButtonEnabled = _words.length >= 12;
    });
  }

  void onTagDelete(int index) {
    setState(() {
      _words.removeAt(index);
      _isContinueButtonEnabled = _words.length >= 12;
    });
  }

  // MARK: -
  // MARK: - ACTIONS

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
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: QZNAppBarWidget(
            preferredSize: Size.fromHeight(80.0),
            themeNotifier: _themeNotifier,
            withBackButton: true,
            title: 'Verify recovery\nphrase'),
        backgroundColor: _themeNotifier.backgroundColor,
        body: UnfocusWidget(
            child: Stack(
          children: [
            Padding(
                padding: EdgeInsets.only(
                    top: 24.0,
                    bottom: padding.bottom + 12.0,
                    left: 24.0,
                    right: 24.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(children: [
                        GradientTextWidget(
                          'Enter your recovery phrase\n12 words separated by commas.',
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
                        SizedBox(height: 30.0),

                        /// TAGS

                        InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            child: Container(
                                width: double.infinity,
                                constraints: BoxConstraints(
                                    minHeight: 234.0,
                                    maxHeight: size.height * 0.45),
                                padding: EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                    color: _themeNotifier.tableColor,
                                    border: Border.all(
                                        width: 0.5,
                                        color: _themeNotifier.outlineColor),
                                    borderRadius: BorderRadius.circular(32.0)),
                                child: SingleChildScrollView(
                                    child: TagEditor(
                                        focusNode: _focusNote,
                                        enabled: true,
                                        autofocus: true,
                                        length: _words.length,
                                        delimiters: [',', ' '],
                                        hasAddButton: false,
                                        tagSpacing: 12.0,
                                        textStyle: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14.0,
                                            color: _themeNotifier.textColor),
                                        inputDecoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: ''),
                                        onTagChanged: (newValue) =>
                                            onTagAdd(newValue),
                                        tagBuilder: (context, index) =>
                                            RecoveryGradientTagWidget(
                                                themeNotifier: _themeNotifier,
                                                title: _words[index],
                                                onCloseTap: () =>
                                                    {onTagDelete(index)})))),
                            onTap: () => {_focusNote.requestFocus()})
                      ]),

                      /// CONTINUE BUTTON
                      QZNGradientButtonWidget(
                          themeNotifier: _themeNotifier,
                          title: 'Unlock Wallet',
                          isEnable: _isContinueButtonEnabled,
                          onTap: () => {continueDidTap()}),
                    ])),
          ],
        )));
  }
}
