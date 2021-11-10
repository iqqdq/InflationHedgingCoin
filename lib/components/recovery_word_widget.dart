import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/device_height_detector.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class RecoveryTagWidget extends StatefulWidget {
  final ThemeNotifier themeNotifier;
  final String? number;
  final String word;
  final bool isVisible;
  final VoidCallback onTap;

  const RecoveryTagWidget(
      {Key? key,
      required this.themeNotifier,
      this.number,
      required this.word,
      required this.isVisible,
      required this.onTap})
      : super(key: key);

  @override
  _RecoveryTagState createState() => _RecoveryTagState();
}

class _RecoveryTagState extends State<RecoveryTagWidget> {
  @override
  Widget build(BuildContext context) {
    final tag = FittedBox(
        child: Container(
            padding:
                EdgeInsets.only(left: 10.0, top: 4.0, bottom: 4.0, right: 10.0),
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1.0,
                    color: widget.isVisible
                        ? widget.themeNotifier.placeholderColor
                        : Colors.transparent),
                borderRadius: BorderRadius.circular(10.0)),
            child: Row(
              children: [
                widget.number == null
                    ? Container()
                    : Text(widget.number!,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: DeviceHeightDetector().getType() ==
                                    DeviceHeight.MEDIUM
                                ? 14.0
                                : 16.0,
                            color: widget.isVisible
                                ? widget.themeNotifier.recoveryWordColor
                                : Colors.transparent)),
                widget.number == null ? Container() : SizedBox(width: 6.0),
                Padding(
                    padding: EdgeInsets.only(bottom: 2.0),
                    child: Text(widget.word,
                        style: TextStyle(
                            fontSize: DeviceHeightDetector().getType() ==
                                    DeviceHeight.MEDIUM
                                ? 14.0
                                : 16.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'NeoGramExtended',
                            color: widget.isVisible
                                ? widget.themeNotifier.titleColor
                                : Colors.transparent))),
              ],
            )));

    final epmtyTag = FittedBox(
        child: Container(
            padding:
                EdgeInsets.only(left: 8.0, top: 4.0, bottom: 2.0, right: 8.0),
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1.0,
                    color: widget.isVisible
                        ? widget.themeNotifier.placeholderColor
                        : Colors.transparent),
                borderRadius: BorderRadius.circular(10.0)),
            child: Row(
              children: [
                widget.number == null
                    ? Container()
                    : Text(widget.number!,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: DeviceHeightDetector().getType() ==
                                    DeviceHeight.MEDIUM
                                ? 14.0
                                : 16.0,
                            color: widget.themeNotifier.recoveryWordColor)),
                widget.number == null ? Container() : SizedBox(width: 6.0),
                Text(widget.word,
                    style: TextStyle(
                        fontSize: DeviceHeightDetector().getType() ==
                                DeviceHeight.MEDIUM
                            ? 14.0
                            : 16.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'NeoGramExtended',
                        color: widget.isVisible
                            ? widget.themeNotifier.titleColor
                            : Colors.transparent)),
              ],
            )));

    return IgnorePointer(
        ignoring: !widget.isVisible,
        child: Container(
            margin: EdgeInsets.only(right: 4.0, bottom: 6.0),
            child: Material(
                color: Colors.transparent,
                child: InkWell(
                    highlightColor: Colors.black38,
                    onTap: () => widget.onTap(),
                    borderRadius: BorderRadius.circular(10.0),
                    child: widget.isVisible
                        ? tag
                        : DottedBorder(
                            color: widget.themeNotifier.placeholderColor,
                            borderType: BorderType.RRect,
                            radius: Radius.circular(10.0),
                            strokeWidth: 1,
                            child: epmtyTag)))));
  }
}
