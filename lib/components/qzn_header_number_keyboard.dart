import 'dart:ui';
// ignore: import_of_legacy_library_into_null_safe
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/qzn_gradient_button.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class QZNHeaderNumberKeyboardWidget extends StatefulWidget {
  final ThemeNotifier themeNotifier;
  final bool showKeyboard;
  final bool isEnterButtonEnabled;
  final String enterButtonTitle;
  final String feeUSDValue;
  final String feeValue;
  final String totalValue;
  final Function(String) didTapKeyButton;
  final VoidCallback onEnterTap;

  QZNHeaderNumberKeyboardWidget({
    required this.themeNotifier,
    required this.showKeyboard,
    required this.isEnterButtonEnabled,
    required this.enterButtonTitle,
    required this.feeUSDValue,
    required this.feeValue,
    required this.totalValue,
    required this.didTapKeyButton,
    required this.onEnterTap,
  });

  @override
  _QZNHeaderNumberKeyboardState createState() =>
      _QZNHeaderNumberKeyboardState();
}

class _QZNHeaderNumberKeyboardState extends State<QZNHeaderNumberKeyboardWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.0, 1.0, curve: Curves.linear),
    );
  }

  // MARK: -
  // MARK; - FUNCTIONS

  Widget getKeyButton(String title, double width) {
    return Container(
        width: width,
        decoration: BoxDecoration(
            color: widget.themeNotifier.keyButtonColor,
            borderRadius: BorderRadius.circular(16.0)),
        child: Material(
            color: Colors.transparent,
            child: InkWell(
              highlightColor: Colors.black38,
              onTap: () => widget.didTapKeyButton(title),
              borderRadius: BorderRadius.circular(16.0),
              child: Center(
                child: AutoSizeText(title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25.0,
                        color: widget.themeNotifier.titleColor)),
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final keyButtonWidth = size.width - 48.0 - 20.0;

    if (widget.showKeyboard)
      _animationController.forward();
    else
      _animationController.reverse();

    return AnimatedBuilder(
        animation: _animation,
        builder: (BuildContext context, _) {
          return Container(
              height: 384.0 * _animation.value,
              padding: EdgeInsets.only(
                  left: 24.0, top: 10.0, right: 24.0, bottom: 40.0),
              color: widget.themeNotifier.tableColor,
              child: Column(
                children: [
                  /// HEADER
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Fee',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14.0,
                                      color: widget
                                          .themeNotifier.placeholderColor)),
                              Container(
                                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                                  padding: EdgeInsets.only(
                                      left: 10.0,
                                      top: 4.0,
                                      bottom: 4.0,
                                      right: 10.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.5,
                                          color: widget
                                              .themeNotifier.placeholderColor),
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: Text(widget.feeUSDValue,
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 14.0,
                                          color: widget.themeNotifier
                                              .placeholderColor))),
                              Text(widget.feeValue,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14.0,
                                      color: widget
                                          .themeNotifier.placeholderColor))
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Text('Total: ${widget.totalValue}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14.0,
                                  color: widget.themeNotifier.placeholderColor))
                        ],
                      )),
                  SizedBox(height: 10.0),

                  /// KEYBOARD
                  Expanded(
                      child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 2.8,
                    children: List<Widget>.generate(11, (index) {
                      return index == 9
                          ? Container()
                          : getKeyButton(
                              index == 10 ? '0' : (index + 1).toString(),
                              keyButtonWidth);
                    }),
                  )),
                  SizedBox(height: 10.0),

                  /// ENTER BUTTON
                  QZNGradientButton(
                      themeNotifier: widget.themeNotifier,
                      title: widget.enterButtonTitle,
                      isEnable: widget.isEnterButtonEnabled,
                      onTap: () => {widget.onEnterTap()}),
                ],
              ));
        });
  }
}
