import 'dart:ui';
// ignore: import_of_legacy_library_into_null_safe
import 'package:auto_size_text_field/auto_size_text_field.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class SwapInputWidget extends StatefulWidget {
  final ThemeNotifier themeNotifier;
  final String title;
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final String? image;
  final String? name;
  final VoidCallback onTokenTap;

  const SwapInputWidget({
    Key? key,
    required this.themeNotifier,
    required this.title,
    required this.textEditingController,
    required this.focusNode,
    this.image,
    this.name,
    required this.onTokenTap,
  }) : super(key: key);

  @override
  _SwapInputState createState() => _SwapInputState();
}

class _SwapInputState extends State<SwapInputWidget> {
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
                      keyboardType: TextInputType.number,
                      keyboardAppearance: Brightness.dark,
                      controller: widget.textEditingController,
                      cursorColor: widget.themeNotifier.blueGradientColor,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.sentences,
                      onTap: () => {},
                      onEditingComplete: () =>
                          {FocusScope.of(context).unfocus()},
                      decoration: InputDecoration(
                        hintText: '0.0',
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
              SizedBox(width: 10.0),

              /// SELECT BUTTON
              Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: widget.themeNotifier.shadowColor
                                .withOpacity(0.25),
                            blurRadius: 20.0,
                            offset: Offset(0, 10))
                      ],
                      color: widget.themeNotifier.inputColor,
                      border: Border.all(
                          width: 1.0, color: widget.themeNotifier.outlineColor),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        highlightColor: Colors.black38,
                        onTap: () => widget.onTokenTap(),
                        borderRadius: BorderRadius.circular(20.0),
                        child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                widget.image != null
                                    ? ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: CachedNetworkImage(
                                          imageUrl: widget.image!,
                                          width: 24.0,
                                          height: 24.0,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : Container(),
                                SizedBox(
                                    width: widget.name == null ? 0.0 : 8.0),
                                Text(
                                    widget.name == null
                                        ? 'Select a token'
                                        : widget.name!,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'NeoGramExtended',
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            widget.themeNotifier.titleColor)),
                              ],
                            )),
                      )))
            ],
          )
        ],
      ),
    );
  }
}
