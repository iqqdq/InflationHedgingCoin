// ignore: import_of_legacy_library_into_null_safe
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/close_button_widget.dart';
import 'package:inflation_hedging_coin/components/device_height_detector.dart';
import 'package:inflation_hedging_coin/components/qzn_header_numeric_keyboard_widget.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';
import 'package:inflation_hedging_coin/components/unfocus_widget.dart';
import 'package:inflation_hedging_coin/screens/available_assets_modal_sheet/available_assets_modal_sheet_screen.dart';
import 'package:inflation_hedging_coin/screens/send_modal_sheet/components/recent_list_item.dart';
import 'package:inflation_hedging_coin/screens/send_modal_sheet/components/scan_button_widget.dart';
import 'package:inflation_hedging_coin/screens/send_modal_sheet/components/send_input_widget.dart';
import 'package:inflation_hedging_coin/screens/send_modal_sheet/components/send_token_selection_widget.dart';
import 'package:inflation_hedging_coin/screens/supply_modal_sheet/components/max_button.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SendModalSheetWidget extends StatefulWidget {
  const SendModalSheetWidget({Key? key}) : super(key: key);

  @override
  _SendModalSheetState createState() => _SendModalSheetState();
}

class _SendModalSheetState extends State<SendModalSheetWidget>
    with TickerProviderStateMixin {
  final _themeNotifier = ThemeNotifier();
  final _scrollController = ScrollController();
  final TextEditingController _addressTextEditingController =
      TextEditingController();
  final FocusNode _addressFocusNode = FocusNode();
  final TextEditingController _valueTextEditingController =
      TextEditingController();
  final FocusNode _valueFocusNode = FocusNode();
  double _textFormFieldWidth = 20.0;
  double _usdValue = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _addressTextEditingController.dispose();
    _valueTextEditingController.dispose();
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
      _valueTextEditingController.text =
          _valueTextEditingController.text + text;
      _valueTextEditingController.selection = TextSelection.fromPosition(
          TextPosition(offset: _valueTextEditingController.text.length));
      _textFormFieldWidth = 20.0 * _valueTextEditingController.text.length;
    });
  }

  void removeText() {
    setState(() {
      if (_valueTextEditingController.text.isNotEmpty) {
        _valueTextEditingController.text = _valueTextEditingController.text
            .substring(0, _valueTextEditingController.text.length - 1);
      }
      _valueTextEditingController.selection = TextSelection.fromPosition(
          TextPosition(offset: _valueTextEditingController.text.length));
      _textFormFieldWidth = 20.0 * _valueTextEditingController.text.length;
    });
  }

  // MARK: -
  // MARK: - ACTIONS

  void recentDidTap(int index) {}

  void scanDidTap() {}

  void maxButtonDidTap() {}

  void tokenSelectionDidTap() {
    showMaterialModalBottomSheet(
        barrierColor: Colors.black.withOpacity(0.5),
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => AvailableAssetsModalSheetWidget());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final style = TextStyle(
        fontFamily: 'NeoGramExtended',
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: _themeNotifier.titleColor);

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
            margin: EdgeInsets.only(top: 60.0),
            height: size.height - 60.0,
            decoration: BoxDecoration(
                color: _themeNotifier.backgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32.0),
                  topRight: Radius.circular(32.0),
                )),
            child: Stack(
              children: [
                UnfocusWidget(
                    onTap: () => {setState(() {})},
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /// CLOSE BUTTON
                              CloseButtonWidget(themeNotifier: _themeNotifier),

                              /// TITLE
                              Expanded(
                                  child: Container(
                                      margin: EdgeInsets.only(right: 74.0),
                                      child: Text('Supply',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'NeoGramExtended',
                                              color:
                                                  _themeNotifier.titleColor)))),
                            ],
                          ),
                          Expanded(
                              child: ListView(
                            controller: _scrollController,
                            padding: EdgeInsets.zero,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// WALLET INPUT
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 24.0, top: 12.0, right: 24.0),
                                  child: SendInputWidget(
                                      themeNotifier: _themeNotifier,
                                      title: 'To',
                                      textEditingController:
                                          _addressTextEditingController,
                                      focusNode: _addressFocusNode)),
                              _addressFocusNode.hasFocus ||
                                      _addressTextEditingController.text.isEmpty
                                  ? Container(
                                      margin: EdgeInsets.only(top: 20.0),
                                      height: 0.25,
                                      color: _themeNotifier.placeholderColor)
                                  : Container(),
                              SizedBox(height: 10.0),

                              /// RECENT WALLET'S LISTVIEW
                              _addressFocusNode.hasFocus ||
                                      _addressTextEditingController.text.isEmpty
                                  ? Padding(
                                      padding: EdgeInsets.only(
                                          top: 20.0,
                                          left: 24.0,
                                          right: 24.0,
                                          bottom: 20.0),
                                      child: Text('Recent',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 16.0,
                                              color: _themeNotifier
                                                  .placeholderColor)),
                                    )
                                  : Container(),

                              _addressFocusNode.hasFocus ||
                                      _addressTextEditingController.text.isEmpty
                                  ? Container(
                                      height:
                                          DeviceHeightDetector().getType() ==
                                                  DeviceHeight.MEDIUM
                                              ? size.height / 2
                                              : size.height - 340.0,
                                      child: ListView.builder(
                                          padding:
                                              EdgeInsets.only(bottom: 40.0),
                                          itemCount: 20,
                                          itemBuilder: (context, index) {
                                            return RecentListItemWidget(
                                                themeNotifier: _themeNotifier,
                                                wallet:
                                                    '0x945534d19f03ec485020576b5bdc51a3303ca46f',
                                                onTap: () => {
                                                      FocusScope.of(context)
                                                          .unfocus(),
                                                      recentDidTap(index)
                                                    });
                                          }))
                                  : Container(),

                              /// TOKEN SELECTION
                              _addressFocusNode.hasFocus ||
                                      _addressTextEditingController.text.isEmpty
                                  ? Container()
                                  : Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 24.0),
                                      child: SendTokenSelectionWidget(
                                          themeNotifier: _themeNotifier,
                                          image:
                                              'https://thefloppa.com/ihc.png',
                                          name: 'IHC',
                                          value: 125664356,
                                          usdValue: 175694,
                                          onTap: () =>
                                              {tokenSelectionDidTap()})),
                              SizedBox(height: 20.0),
                              _addressFocusNode.hasFocus ||
                                      _addressTextEditingController.text.isEmpty
                                  ? Container()
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                          /// MAX BUTTON
                                          Container(
                                            margin: EdgeInsets.only(right: 9.0),
                                            child: MaxButtonWidget(
                                                themeNotifier: _themeNotifier,
                                                onTap: () =>
                                                    {maxButtonDidTap()}),
                                          ),

                                          /// VALUE INPUT
                                          Container(
                                              margin:
                                                  EdgeInsets.only(right: 9.0),
                                              width: _textFormFieldWidth < 30.0
                                                  ? 30.0
                                                  : _textFormFieldWidth,
                                              constraints: BoxConstraints(
                                                  maxWidth: size.width -
                                                      124.0 -
                                                      48.0),
                                              child: AutoSizeTextField(
                                                  showCursor: true,
                                                  readOnly: true,
                                                  focusNode: _valueFocusNode,
                                                  textAlign: TextAlign.center,
                                                  controller:
                                                      _valueTextEditingController,
                                                  cursorColor: _themeNotifier
                                                      .blueGradientColor,
                                                  decoration: InputDecoration(
                                                    hintText: '0',
                                                    hintStyle: style.copyWith(
                                                        color: _themeNotifier
                                                            .placeholderColor),
                                                    contentPadding:
                                                        EdgeInsets.zero,
                                                    counterText: '',
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                      ),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                      ),
                                                    ),
                                                  ),
                                                  style: style,
                                                  onTap: () => {
                                                        _scrollController
                                                            .animateTo(
                                                          DeviceHeightDetector()
                                                                      .getType() ==
                                                                  DeviceHeight
                                                                      .MEDIUM
                                                              ? 120.0
                                                              : 0.0,
                                                          curve: Curves.easeOut,
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                        ),
                                                        setState(() {})
                                                      },
                                                  onEditingComplete: () => {
                                                        FocusScope.of(context)
                                                            .unfocus()
                                                      })),

                                          /// TOKEN TITLE
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(right: 16.0),
                                              child: Text('IHC',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: _themeNotifier
                                                          .titleColor)))
                                        ]),

                              /// USD VALUE
                              _addressFocusNode.hasFocus ||
                                      _addressTextEditingController.text.isEmpty
                                  ? Container()
                                  : Align(
                                      alignment: Alignment.center,
                                      child: Text(r'$' + '$_usdValue',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 14.0,
                                              color: _themeNotifier
                                                  .placeholderColor))),
                              _valueFocusNode.hasFocus
                                  ? SizedBox(
                                      height:
                                          DeviceHeightDetector().getType() ==
                                                  DeviceHeight.MEDIUM
                                              ? 360.0
                                              : 120.0)
                                  : Container()
                            ],
                          )),
                        ])),

                /// SCAN BUTTON
                Opacity(
                    opacity: _addressFocusNode.hasFocus ? 1.0 : 0.0,
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: ScanButtonWidget(
                            themeNotifier: _themeNotifier,
                            onTap: () => {scanDidTap()}))),

                /// KEYBOARD
                Align(
                    alignment: Alignment.bottomCenter,
                    child: QZNHeaderNumericKeyboardWidget(
                        themeNotifier: _themeNotifier,
                        showKeyboard: _valueFocusNode.hasFocus,
                        isEnterButtonEnabled: false,
                        enterButtonTitle: 'No funds available',
                        feeUSDValue: r'$25 > 3 min',
                        feeValue: '0.000125 ETH',
                        totalValue: '125,500 IHC',
                        didTapKeyButton: (text) => {setText(text)},
                        onRemoveTap: () => {removeText()},
                        onEnterTap: () => {}))
              ],
            )));
  }
}
