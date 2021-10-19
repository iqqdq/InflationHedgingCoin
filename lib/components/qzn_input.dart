import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class QZNInputWidget extends StatefulWidget {
  final ThemeNotifier themeNotifier;
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final String? placeholder;

  const QZNInputWidget({
    Key? key,
    required this.themeNotifier,
    required this.textEditingController,
    required this.focusNode,
    this.placeholder,
  }) : super(key: key);

  @override
  _QZNInputState createState() => _QZNInputState();
}

class _QZNInputState extends State<QZNInputWidget> {
  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
        fontFamily: 'Poppins',
        fontSize: 16.0,
        color: widget.themeNotifier.titleColor);

    return Container(
        height: 60.0,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: widget.themeNotifier.shadowColor,
                  blurRadius: 16.0,
                  offset: Offset(0, 24))
            ],
            color: widget.themeNotifier.tableColor,
            border: Border.all(
                width: 1.0, color: widget.themeNotifier.outlineColor),
            borderRadius: BorderRadius.circular(32.0)),
        child: Center(
            child: TextFormField(
                focusNode: widget.focusNode,
                textAlign: TextAlign.left,
                keyboardAppearance: Brightness.dark,
                controller: widget.textEditingController,
                cursorColor: widget.themeNotifier.blueGradientColor,
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.sentences,
                onTap: () => {},
                onEditingComplete: () => {FocusScope.of(context).unfocus()},
                decoration: InputDecoration(
                  hintText:
                      widget.placeholder == null ? '' : widget.placeholder,
                  hintStyle: style.copyWith(
                      color: widget.themeNotifier.placeholderColor),
                  contentPadding: EdgeInsets.symmetric(horizontal: 25.0),
                  counterText: '',
                  fillColor: Color.fromRGBO(21, 33, 47, 1.0),
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
                style: style)));
  }
}
