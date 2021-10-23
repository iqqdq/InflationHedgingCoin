import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/qzn_button_widget.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';
import 'package:qr_flutter/qr_flutter.dart';

class WalletAddressWidget extends StatefulWidget {
  final ThemeNotifier themeNotifier;
  final String qrData;
  final String walletAddress;
  final VoidCallback onShareTap;
  final VoidCallback onCopyTap;
  final VoidCallback onCloseTap;

  WalletAddressWidget(
      {required this.themeNotifier,
      required this.walletAddress,
      required this.onShareTap,
      required this.onCopyTap,
      required this.onCloseTap,
      required this.qrData});

  @override
  _WalletAddressState createState() => _WalletAddressState();
}

class _WalletAddressState extends State<WalletAddressWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
        opacity: _animationController.drive(CurveTween(curve: Curves.easeOut)),
        child: SizedBox.expand(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 24.0),
            color: widget.themeNotifier.backgroundColor.withOpacity(0.9),
            child: Center(
              child: Container(
                constraints: BoxConstraints(maxHeight: 400.0),
                padding: EdgeInsets.all(18.0),
                decoration: BoxDecoration(
                  color: widget.themeNotifier.tableColor,
                  border: Border.all(
                      width: 1.0, color: widget.themeNotifier.outlineColor),
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 26.0),
                        Text('Your address',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'NeoGramExtended',
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                                color: widget.themeNotifier.titleColor)),

                        /// CLOSE BUTTON
                        Padding(
                            padding: EdgeInsets.only(bottom: 4.0),
                            child: InkWell(
                              onTap: () => {
                                _animationController
                                    .reverse()
                                    .then((value) => widget.onCloseTap())
                              },
                              child: Image.asset('assets/ic_close.png'),
                            )),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Text('Share your address to receive\nany ERC–20 tokens',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14.0,
                            color: widget.themeNotifier.textColor)),
                    SizedBox(height: 16.0),
                    QrImage(
                      data: widget.qrData,
                      version: QrVersions.auto,
                      size: 135.0,
                      foregroundColor: widget.themeNotifier.titleColor,
                    ),
                    SizedBox(height: 16.0),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 44.0),
                        child: Text(widget.walletAddress,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14.0,
                                color: widget.themeNotifier.textColor))),
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        QZNButtonWidget(
                            themeNotifier: widget.themeNotifier,
                            image: 'assets/ic_share.png',
                            title: 'Share',
                            onTap: () => {widget.onShareTap()}),
                        SizedBox(width: 10.0),
                        QZNButtonWidget(
                            themeNotifier: widget.themeNotifier,
                            image: 'assets/ic_copy.png',
                            title: 'Copy',
                            onTap: () => {widget.onCopyTap()}),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
