// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/device_height_detector.dart';
import 'package:inflation_hedging_coin/components/qzn_gradient_button_widget.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';
import 'package:inflation_hedging_coin/screens/back_up/back_up_screen.dart';
import 'package:inflation_hedging_coin/screens/start/components/circle_animation_widget.dart';
import 'package:inflation_hedging_coin/screens/start/components/create_wallet_button_widget.dart';
import 'package:inflation_hedging_coin/screens/wallet_connect/wallet_connect_screen.dart';

class StartScreenWidget extends StatefulWidget {
  const StartScreenWidget({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreenWidget>
    with TickerProviderStateMixin {
  final _themeNotifier = ThemeNotifier();
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = new AnimationController(
      vsync: this,
    );

    startAnimation();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // MARK: -
  // MARK: - FUNCTION

  void startAnimation() {
    _animationController.stop();
    _animationController.reset();
    _animationController.repeat(
      period: Duration(milliseconds: 2000),
    );
  }

  // MARK: -
  // MARK: - ACTIONS

  void connectWalletDidTap() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => WalletConnectScreenWidget()));
  }

  void createWalletDidTap() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => BackUpScreenWidget()));
  }

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;

    return Scaffold(
        backgroundColor: _themeNotifier.backgroundColor,
        body: Stack(children: [
          Padding(
              padding: EdgeInsets.only(bottom: 230.0),
              child: Stack(
                children: [
                  /// ANIMATION
                  // CustomPaint(
                  //     painter:
                  //         SpritePainter(_themeNotifier, _animationController),
                  //     child: SizedBox(
                  //       width: size.height * 4,
                  //       height: size.height * 4,
                  //     )),
                  CircleAnimationWidget(themeNotifier: _themeNotifier),

                  /// LOGO IMAGE
                  Center(
                    child: Image.asset('assets/ic_logo.png',
                        width: 160.0, height: 160.0, fit: BoxFit.cover),
                  ),
                ],
              )),

          /// TITLE
          Padding(
              padding: EdgeInsets.only(
                  top: DeviceHeightDetector().getType() == DeviceHeight.MEDIUM
                      ? 120.0
                      : 160.0),
              child: Center(
                child: Text('Inflation\nHedging\nCoin',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'NeoGramExtended',
                        fontSize: DeviceHeightDetector().getType() ==
                                DeviceHeight.MEDIUM
                            ? 36.0
                            : 48.0,
                        fontWeight: FontWeight.bold,
                        color: _themeNotifier.titleColor)),
              )),

          /// CONNECT WALLET BUTTON
          Padding(
              padding: EdgeInsets.only(
                  left: 24.0, right: 24.0, bottom: padding.bottom + 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  QZNGradientButtonWidget(
                      themeNotifier: _themeNotifier,
                      title: 'Connect Wallet',
                      isEnable: true,
                      onTap: () => {connectWalletDidTap()}),

                  /// CREATE WALLET BUTTON

                  Container(
                    margin: EdgeInsets.only(top: 16.0),
                    child: CreateWalletButtonWidget(
                        themeNotifier: _themeNotifier,
                        title: 'Create Wallet',
                        isEnable: true,
                        onTap: () => {createWalletDidTap()}),
                  )
                ],
              ))
        ]));
  }
}
