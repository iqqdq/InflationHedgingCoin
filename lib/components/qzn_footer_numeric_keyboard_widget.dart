import 'dart:ui';
// ignore: import_of_legacy_library_into_null_safe
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/qzn_gradient_button_widget.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class QZNFooterNumericKeyboardWidget extends StatefulWidget {
  final ThemeNotifier themeNotifier;
  final bool showKeyboard;
  final bool isEnterButtonEnabled;
  final String enterButtonTitle;
  final String footerTitle;
  final String footerValue;
  final Function(String) didTapKeyButton;
  final VoidCallback onRemoveTap;
  final VoidCallback onEnterTap;

  QZNFooterNumericKeyboardWidget({
    required this.themeNotifier,
    required this.showKeyboard,
    required this.isEnterButtonEnabled,
    required this.enterButtonTitle,
    required this.footerTitle,
    required this.footerValue,
    required this.didTapKeyButton,
    required this.onRemoveTap,
    required this.onEnterTap,
  });

  @override
  _QZNFooterNumericKeyboardState createState() =>
      _QZNFooterNumericKeyboardState();
}

class _QZNFooterNumericKeyboardState
    extends State<QZNFooterNumericKeyboardWidget>
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

  Widget getRemoveButton(double width) {
    return Container(
        width: width,
        decoration: BoxDecoration(
            color: widget.themeNotifier.keyButtonColor,
            borderRadius: BorderRadius.circular(16.0)),
        child: Material(
            color: Colors.transparent,
            child: InkWell(
              highlightColor: Colors.black38,
              onTap: () => widget.onRemoveTap(),
              borderRadius: BorderRadius.circular(16.0),
              child: Center(child: Image.asset('assets/ic_arrow_back.png')),
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
              height: 362.0 * _animation.value,
              padding: EdgeInsets.only(
                  left: 24.0, top: 20.0, right: 24.0, bottom: 40.0),
              color: widget.themeNotifier.tableColor,
              child: Column(
                children: [
                  /// KEYBOARD
                  Expanded(
                      child: GridView.count(
                    padding: EdgeInsets.zero,
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 2.8,
                    children: List<Widget>.generate(11, (index) {
                      return index == 9
                          ? getRemoveButton(keyButtonWidth)
                          : getKeyButton(
                              index == 10 ? '0' : (index + 1).toString(),
                              keyButtonWidth);
                    }),
                  )),
                  SizedBox(height: 10.0),

                  /// ENTER BUTTON
                  QZNGradientButtonWidget(
                      themeNotifier: widget.themeNotifier,
                      title: widget.enterButtonTitle,
                      isEnable: widget.isEnterButtonEnabled,
                      onTap: () => {widget.onEnterTap()}),
                  SizedBox(height: 16.0),

                  /// FOOTER
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: Text(widget.footerTitle,
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14.0,
                                      color: widget
                                          .themeNotifier.placeholderColor))),
                          Expanded(
                              child: Text(widget.footerValue,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14.0,
                                      color: widget.themeNotifier.titleColor)))
                        ],
                      ))
                ],
              ));
        });
  }
}
