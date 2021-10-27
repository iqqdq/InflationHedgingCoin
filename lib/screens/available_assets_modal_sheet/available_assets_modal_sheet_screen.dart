import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/close_button_widget.dart';
import 'package:inflation_hedging_coin/components/qzn_input_widget.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';
import 'package:inflation_hedging_coin/components/unfocus_widget.dart';
import 'package:inflation_hedging_coin/screens/wallet/components/wallet_list_item.dart';

class AvailableAssetsModalSheetWidget extends StatefulWidget {
  const AvailableAssetsModalSheetWidget({Key? key}) : super(key: key);

  @override
  _AvailableAssetsModalSheetState createState() =>
      _AvailableAssetsModalSheetState();
}

class _AvailableAssetsModalSheetState
    extends State<AvailableAssetsModalSheetWidget> {
  final _themeNotifier = ThemeNotifier();
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  // MARK: -
  // MARK: - ACTIONS

  void tokenDidTap(int index) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
            margin: EdgeInsets.only(top: 120.0),
            decoration: BoxDecoration(
                color: _themeNotifier.backgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32.0),
                  topRight: Radius.circular(32.0),
                )),
            child: SizedBox.expand(
                child: Stack(children: [
              UnfocusWidget(
                  onTap: () => {setState(() {})},
                  child: Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                /// CLOSE BUTTON
                                CloseButtonWidget(
                                    themeNotifier: _themeNotifier),

                                /// TITLE
                                Text('Available assets',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'NeoGramExtended',
                                        color: _themeNotifier.titleColor)),

                                SizedBox(width: 74.0)
                              ],
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// SEARCH INPUT
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 24.0,
                                        top: 16.0,
                                        right: 24.0,
                                        bottom: 20.0),
                                    child: QZNInputWidget(
                                        themeNotifier: _themeNotifier,
                                        textEditingController:
                                            _textEditingController,
                                        focusNode: _focusNode,
                                        image: 'assets/ic_search.png',
                                        placeholder: 'Search token')),
                                Container(
                                    height: 0.25,
                                    color: _themeNotifier.placeholderColor),

                                /// TOKEN LISTVIEW
                                Expanded(
                                    child: ListView.builder(
                                        padding: EdgeInsets.only(
                                            top: 16.0, bottom: 40.0),
                                        itemCount: 20,
                                        itemBuilder: (context, index) {
                                          return WalletListItemWidget(
                                              themeNotifier: _themeNotifier,
                                              image:
                                                  'https://s2.coinmarketcap.com/static/img/coins/64x64/3349.png',
                                              name: 'GPYX',
                                              value: 126753542,
                                              onTap: () =>
                                                  {tokenDidTap(index)});
                                        }))
                              ],
                            ))
                          ])))
            ]))));
  }
}
