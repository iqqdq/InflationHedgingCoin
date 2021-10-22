import 'dart:ui';
// ignore: import_of_legacy_library_into_null_safe
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:inflation_hedging_coin/components/qzn_button.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:intl/intl.dart';

class TransactionDetailsWidget extends StatefulWidget {
  final ThemeNotifier themeNotifier;
  final String image;
  final String name;
  final double value;
  final double feeUSDvalue;
  final double feeETHValue;
  final int status;
  final String walletAddress;
  final DateTime dateTime;

  final VoidCallback onLinkTap;
  final VoidCallback onCloseTap;

  TransactionDetailsWidget({
    required this.themeNotifier,
    required this.image,
    required this.name,
    required this.value,
    required this.feeUSDvalue,
    required this.feeETHValue,
    required this.status,
    required this.walletAddress,
    required this.dateTime,
    required this.onLinkTap,
    required this.onCloseTap,
  });

  @override
  _TransactionDetailsState createState() => _TransactionDetailsState();
}

class _TransactionDetailsState extends State<TransactionDetailsWidget>
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
    final titleStyle = TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14.0,
        color: widget.themeNotifier.placeholderColor);
    final pendingStatus = Row(
      children: [
        SpinKitCircle(size: 20.0, color: widget.themeNotifier.placeholderColor),
        SizedBox(width: 20.0),
        Text('Pending',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16.0,
                color: widget.themeNotifier.placeholderColor)),
      ],
    );

    // DATA
    final fmfValue = FlutterMoneyFormatter(
        amount: widget.value % 1 == 0 ? widget.value : widget.value);
    final fmfUSDValue = FlutterMoneyFormatter(
        amount: widget.feeUSDvalue % 1 == 0
            ? widget.feeUSDvalue
            : widget.feeUSDvalue);
    final date = DateFormat.yMMMd().format(widget.dateTime);
    final time = DateFormat.Hm().format(widget.dateTime);

    return FadeTransition(
        opacity: _animationController.drive(CurveTween(curve: Curves.easeOut)),
        child: SizedBox.expand(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 24.0),
            color: widget.themeNotifier.backgroundColor.withOpacity(0.9),
            child: Center(
              child: Container(
                constraints: BoxConstraints(maxHeight: 440.0),
                padding: EdgeInsets.all(18.0),
                decoration: BoxDecoration(
                  color: widget.themeNotifier.tableColor,
                  border: Border.all(
                      width: 1.0, color: widget.themeNotifier.outlineColor),
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text('Transaction Details',
                                style: TextStyle(
                                    fontFamily: 'NeoGramExtended',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700,
                                    color: widget.themeNotifier.titleColor))),
                        Padding(
                            padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
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

                    /// TOKEN
                    Row(
                      children: [
                        CachedNetworkImage(
                            imageUrl: widget.image,
                            width: 40.0,
                            height: 40.0,
                            fit: BoxFit.cover),
                        SizedBox(width: 12.0),
                        Expanded(
                          child: Text(
                              '${fmfValue.output.nonSymbol} ${widget.name}',
                              style: TextStyle(
                                  fontFamily: 'NeoGramExtended',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: widget.themeNotifier.titleColor)),
                        )
                      ],
                    ),
                    SizedBox(height: 16.0),

                    /// FEE
                    Row(children: [
                      SizedBox(width: 14.0),
                      Image.asset('assets/ic_arrow_down.png'),
                      SizedBox(width: 26.0),

                      /// USD
                      Text(r'Fee $' + '${fmfUSDValue.output.nonSymbol}',
                          textAlign: TextAlign.start,
                          style: titleStyle.copyWith(
                              color: widget.themeNotifier.textColor)),
                      SizedBox(width: 8.0),

                      /// ETH
                      Expanded(
                          child: Text('${widget.feeETHValue} ETH',
                              textAlign: TextAlign.start, style: titleStyle))
                    ]),
                    SizedBox(height: 16.0),

                    /// STATUS
                    Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: widget.status == 0 ? 12.0 : 0.0),
                        child: widget.status == 0
                            ? pendingStatus
                            : Container(
                                padding: EdgeInsets.only(
                                    left: 16.0,
                                    top: 8.0,
                                    bottom: 8.0,
                                    right: 16.0),
                                decoration: BoxDecoration(
                                    color: widget.themeNotifier.statusColor
                                        .withOpacity(0.025),
                                    border: Border.all(
                                        width: 0.25,
                                        color: widget.themeNotifier
                                            .lightGreenGradientColor),
                                    borderRadius: BorderRadius.circular(24.0)),
                                child: Row(
                                  children: [
                                    Image.asset('assets/ic_status_check.png',
                                        color:
                                            widget.themeNotifier.statusColor),
                                    SizedBox(width: 24.0),
                                    Text(
                                        widget.status == 1 ? 'Sent' : 'Receive',
                                        style: titleStyle.copyWith(
                                            color: widget
                                                .themeNotifier.statusColor))
                                  ],
                                ),
                              )),
                    SizedBox(height: 16.0),

                    /// TO WALLET
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text('To', style: titleStyle)),
                    SizedBox(height: 6.0),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(widget.walletAddress,
                            style: titleStyle.copyWith(
                                color: widget.themeNotifier.textColor))),
                    SizedBox(height: 16.0),

                    /// TIMESTAMP
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text('Timestamp', style: titleStyle)),
                    SizedBox(height: 6.0),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text('$time, $date',
                            style: titleStyle.copyWith(
                                color: widget.themeNotifier.textColor))),
                    SizedBox(height: 24.0),

                    /// VIEW ON ETHERSCAN
                    Align(
                      alignment: Alignment.center,
                      child: FittedBox(
                        child: QZNButtonWidget(
                            themeNotifier: widget.themeNotifier,
                            title: 'View on Etherscan',
                            image: 'assets/ic_etherscan_arrow.png',
                            isImageOnRight: true,
                            onTap: () => {widget.onLinkTap()}),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
