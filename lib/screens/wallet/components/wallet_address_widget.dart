import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/qzn_button_widget.dart';
import 'package:inflation_hedging_coin/components/qzn_toast_widget.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';
import 'package:inflation_hedging_coin/components/transparent_route.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share/share.dart';
import 'package:flutter/services.dart';

class WalletAddressWidget extends StatefulWidget {
  final ThemeNotifier themeNotifier;
  final String walletAddress;

  WalletAddressWidget(
      {required this.themeNotifier, required this.walletAddress});

  @override
  _WalletAddressState createState() => _WalletAddressState();
}

class _WalletAddressState extends State<WalletAddressWidget> {
  // MARK: -
  // MARK: - ACTIONS

  void shareDidTap() {
    Share.share('My wallet address:\n${widget.walletAddress}');
  }

  void copyDidTap() {
    Clipboard.setData(new ClipboardData(text: widget.walletAddress)).then((_) {
      Navigator.of(context).push(TransparentRoute(
          builder: (BuildContext context) => QZNToastWidget(
              themeNotifier: widget.themeNotifier,
              image: 'assets/ic_check.png',
              text: 'Your address was copied successfully!')));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          SizedBox.expand(
              child: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                color: widget.themeNotifier.backgroundColor.withOpacity(0.9)),
            onTap: () => Navigator.pop(context),
          )),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Center(
                child: Container(
                    padding: EdgeInsets.all(18.0),
                    decoration: BoxDecoration(
                      color: widget.themeNotifier.tableColor,
                      border: Border.all(
                          width: 1.0, color: widget.themeNotifier.outlineColor),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Wrap(children: [
                      Column(
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
                                    onTap: () => {Navigator.pop(context)},
                                    child: Image.asset('assets/ic_close.png'),
                                  )),
                            ],
                          ),
                          SizedBox(height: 16.0),
                          Text(
                              'Share your address to receive\nany ERC–20 tokens',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14.0,
                                  color: widget.themeNotifier.textColor)),
                          SizedBox(height: 16.0),
                          QrImage(
                            data: widget.walletAddress,
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
                                  onTap: () => shareDidTap()),
                              SizedBox(width: 10.0),
                              QZNButtonWidget(
                                  themeNotifier: widget.themeNotifier,
                                  image: 'assets/ic_copy.png',
                                  title: 'Copy',
                                  onTap: () => copyDidTap()),
                            ],
                          )
                        ],
                      ),
                    ])),
              ))
        ]));
  }
}
