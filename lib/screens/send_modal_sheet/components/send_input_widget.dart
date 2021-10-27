import 'dart:ui';
// ignore: import_of_legacy_library_into_null_safe
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class SendInputWidget extends StatefulWidget {
  final ThemeNotifier themeNotifier;
  final String title;
  final TextEditingController textEditingController;
  final FocusNode focusNode;

  const SendInputWidget({
    Key? key,
    required this.themeNotifier,
    required this.title,
    required this.textEditingController,
    required this.focusNode,
  }) : super(key: key);

  @override
  _SendInputState createState() => _SendInputState();
}

class _SendInputState extends State<SendInputWidget> {
  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
        fontFamily: 'NeoGramExtended',
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: widget.themeNotifier.titleColor);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.0),
      padding:
          EdgeInsets.only(left: 25.0, top: 15.0, right: 12.0, bottom: 12.0),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: widget.themeNotifier.shadowColor,
                blurRadius: 16.0,
                offset: Offset(0, 24))
          ],
          color: widget.themeNotifier.tableColor,
          border:
              Border.all(width: 1.0, color: widget.themeNotifier.outlineColor),
          borderRadius: BorderRadius.circular(32.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title,
              style: TextStyle(
                  fontFamily: 'NeoGramExtended',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: widget.themeNotifier.placeholderColor)),
          SizedBox(height: 7.0),
          Row(
            children: [
              /// INPUT
              Expanded(
                  child: AutoSizeTextField(
                      focusNode: widget.focusNode,
                      textAlign: TextAlign.left,
                      autocorrect: false,
                      keyboardAppearance: Brightness.dark,
                      controller: widget.textEditingController,
                      cursorColor: widget.themeNotifier.blueGradientColor,
                      textInputAction: TextInputAction.done,
                      textCapitalization: TextCapitalization.sentences,
                      onTap: () => {},
                      onChanged: (text) => {setState(() {})},
                      onEditingComplete: () =>
                          {FocusScope.of(context).unfocus(), setState(() {})},
                      decoration: InputDecoration(
                        hintText: '0x.. address',
                        hintStyle: style.copyWith(
                            color: widget.themeNotifier.placeholderColor),
                        contentPadding: EdgeInsets.zero,
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
                      style: style)),
            ],
          )
        ],
      ),
    );
  }
}
