// ignore: import_of_legacy_library_into_null_safe
import 'package:auto_size_text_field/auto_size_text_field.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/qzn_footer_numeric_keyboard.dart';
import 'package:inflation_hedging_coin/components/qzn_segmented_control.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';
import 'package:inflation_hedging_coin/screens/supply_modal_sheet/components/max_button.dart';

class BorrowModalSheetWidget extends StatefulWidget {
  const BorrowModalSheetWidget({Key? key}) : super(key: key);

  @override
  _BorrowModalSheetState createState() => _BorrowModalSheetState();
}

class _BorrowModalSheetState extends State<BorrowModalSheetWidget> {
  final _themeNotifier = ThemeNotifier();
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  double _textFormFieldWidth = 20.0;

  @override
  void initState() {
    super.initState();

    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  // MARK: -
  // MARK: - FUNCTIONS

  Widget getInfoRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 24.0,
        left: 24.0,
        right: 24.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Text(
                title,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14.0,
                    color: _themeNotifier.placeholderColor),
              )),
          Expanded(
              child: Text(
            value,
            textAlign: TextAlign.right,
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14.0,
                color: _themeNotifier.titleColor),
          ))
        ],
      ),
    );
  }

  void setText(String text) {
    setState(() {
      _textEditingController.text = _textEditingController.text + text;
      _textEditingController.selection = TextSelection.fromPosition(
          TextPosition(offset: _textEditingController.text.length));
      _textFormFieldWidth = 20.0 * _textEditingController.text.length;
    });
  }

  void removeText() {
    setState(() {
      if (_textEditingController.text.isNotEmpty) {
        _textEditingController.text = _textEditingController.text
            .substring(0, _textEditingController.text.length - 1);
      }
      _textEditingController.selection = TextSelection.fromPosition(
          TextPosition(offset: _textEditingController.text.length));
      _textFormFieldWidth = 20.0 * _textEditingController.text.length;
    });
  }

  // MARK: -
  // MARK: - ACTIONS

  void maxButtonDidTap() {}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final style = TextStyle(
        fontFamily: 'NeoGramExtended',
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: _themeNotifier.titleColor);

    return Container(
      margin: EdgeInsets.only(top: 60.0),
      decoration: BoxDecoration(
          color: _themeNotifier.backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.0),
            topRight: Radius.circular(32.0),
          )),
      child: SizedBox.expand(
          child: Stack(
        children: [
          Padding(
              padding: EdgeInsets.only(
                  left: 24.0, top: 16.0, right: 24.0, bottom: 24.0),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// CLOSE BUTTON
                    Container(
                        width: 50.0,
                        height: 40.0,
                        child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                                highlightColor: Colors.black38,
                                onTap: () => {Navigator.pop(context)},
                                borderRadius: BorderRadius.circular(20.0),
                                child: Center(
                                    child: Text(
                                  'Close',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16.0,
                                      color: _themeNotifier.placeholderColor),
                                ))))),

                    /// TITLE
                    Text('Borrow',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'NeoGramExtended',
                            color: _themeNotifier.titleColor)),

                    Row(
                      children: [
                        SizedBox(width: 10.0),

                        /// TOKEN IMAGE
                        CachedNetworkImage(
                          imageUrl:
                              'https://s2.coinmarketcap.com/static/img/coins/64x64/3349.png',
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.cover,
                        )
                      ],
                    )
                  ],
                ),

                /// BODY
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.only(top: 20.0, bottom: 362.0),
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            /// MAX BUTTON
                            MaxButtonWidget(
                                themeNotifier: _themeNotifier,
                                onTap: () => {maxButtonDidTap()}),
                            SizedBox(width: 9.0),

                            /// INPUT
                            Container(
                                width: _textFormFieldWidth < 30.0
                                    ? 30.0
                                    : _textFormFieldWidth,
                                constraints: BoxConstraints(
                                    maxWidth: size.width - 124.0 - 48.0),
                                child: AutoSizeTextField(
                                    showCursor: true,
                                    readOnly: true,
                                    focusNode: _focusNode,
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    keyboardAppearance: Brightness.dark,
                                    controller: _textEditingController,
                                    cursorColor:
                                        _themeNotifier.blueGradientColor,
                                    textInputAction: TextInputAction.done,
                                    decoration: InputDecoration(
                                      hintText: '0',
                                      hintStyle: style.copyWith(
                                          color:
                                              _themeNotifier.placeholderColor),
                                      contentPadding: EdgeInsets.zero,
                                      counterText: '',
                                      fillColor:
                                          Color.fromRGBO(21, 33, 47, 1.0),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                        ),
                                      ),
                                    ),
                                    style: style,
                                    onTap: () => {},
                                    onEditingComplete: () =>
                                        {FocusScope.of(context).unfocus()})),
                            SizedBox(width: 9.0),

                            /// TOKEN TITLE
                            Padding(
                                padding: EdgeInsets.only(right: 16.0),
                                child: Text('IHC',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: _themeNotifier.titleColor)))
                          ]),
                      SizedBox(height: 30.0),

                      /// SEGMENTED CONTROL
                      QZNSegmentedControl(
                          themeNotifier: _themeNotifier,
                          width: size.width,
                          titles: ['Supply', 'Withdraw'],
                          onTap: (index) => {print('tab index is: $index')}),
                      SizedBox(height: 24.0),

                      /// INFO
                      getInfoRow('Borrow APY', '0.08%'),
                      getInfoRow('Distribution APY', '0%'),
                      getInfoRow('Borrow Balance', r'$12000'),
                      getInfoRow('Borrow Limit Used', '72%'),
                    ],
                  ),
                )
              ])),

          /// KEYBOARD
          Align(
              alignment: Alignment.bottomCenter,
              child: QZNFooterNumericKeyboardWidget(
                  themeNotifier: _themeNotifier,
                  showKeyboard: true,
                  isEnterButtonEnabled: false,
                  enterButtonTitle: 'Enter amount',
                  footerTitle: 'Wallet Balance',
                  footerValue: '0 IHC',
                  didTapKeyButton: (text) => {setText(text)},
                  onRemoveTap: () => {removeText()},
                  onEnterTap: () => {}))
        ],
      )),
    );
  }
}
