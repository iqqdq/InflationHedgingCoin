// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/qzn_app_bar_widget.dart';
import 'package:inflation_hedging_coin/components/qzn_input_widget.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';
import 'package:inflation_hedging_coin/components/unfocus_widget.dart';
import 'package:inflation_hedging_coin/screens/token_selection/components/token_selection_list_item.dart';

class TokenSelectionScreenWidget extends StatefulWidget {
  const TokenSelectionScreenWidget({Key? key}) : super(key: key);

  @override
  _TokenSelectionScreenState createState() => _TokenSelectionScreenState();
}

class _TokenSelectionScreenState extends State<TokenSelectionScreenWidget> {
  final _themeNotifier = ThemeNotifier();
  final _textEditingController = TextEditingController();
  final _focusNode = FocusNode();

  // MARK: -
  // MARK: - ACTIONS

  void tokenDidTap(int index) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: QZNAppBarWidget(
          preferredSize: Size.fromHeight(80.0),
          themeNotifier: _themeNotifier,
          title: 'Select a token',
          withBackButton: true,
        ),
        backgroundColor: _themeNotifier.backgroundColor,
        body: UnfocusWidget(
            child: SizedBox.expand(
                child: Stack(children: [
          Column(
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: QZNInputWidget(
                      themeNotifier: _themeNotifier,
                      textEditingController: _textEditingController,
                      focusNode: _focusNode,
                      placeholder: 'Search name or paste address')),
              SizedBox(height: 12.0),
              Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.only(top: 12.0, bottom: 40.0),
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return TokenSelectionItemWidget(
                            themeNotifier: _themeNotifier,
                            image:
                                'https://s2.coinmarketcap.com/static/img/coins/64x64/3349.png',
                            name: 'GPYX',
                            onTap: () => {tokenDidTap(index)});
                      }))
            ],
          ),
        ]))));
  }
}
