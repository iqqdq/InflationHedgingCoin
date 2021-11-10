import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class QZNSegmentedControlWidget extends StatefulWidget {
  final ThemeNotifier themeNotifier;
  final double width;
  final List<String> titles;
  final void Function(int) onTap;

  const QZNSegmentedControlWidget({
    Key? key,
    required this.themeNotifier,
    required this.width,
    required this.titles,
    required this.onTap,
  }) : super(key: key);

  @override
  _QZNSegmentedControlWidgetState createState() =>
      _QZNSegmentedControlWidgetState();
}

class _QZNSegmentedControlWidgetState extends State<QZNSegmentedControlWidget>
    with TickerProviderStateMixin {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final padding = 4.0;
    final width = widget.width / widget.titles.length - padding;

    return Container(
        padding: EdgeInsets.all(padding),
        width: widget.width,
        height: 44.0,
        decoration: BoxDecoration(
            color: widget.themeNotifier.segmentedControlColor,
            borderRadius: BorderRadius.circular(24.0)),
        child: Stack(
          children: [
            Row(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 150),
                  width: _selectedIndex == 0
                      ? width * _selectedIndex
                      : width * _selectedIndex,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(24.0)),
                ),
                Container(
                  width: _selectedIndex == 0 ? width + padding : width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          widget.themeNotifier.blueGradientColor,
                          widget.themeNotifier.pinkGradientColor
                        ],
                      ),
                      borderRadius: BorderRadius.circular(24.0)),
                )
              ],
            ),
            ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemCount: widget.titles.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () => {
                            setState(() {
                              _selectedIndex = index;
                              widget.onTap(index);
                            })
                          },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Container(
                          width: width,
                          height: 36.0,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(24.0)),
                          child: Stack(
                            children: [
                              Align(
                                  alignment: Alignment.center,
                                  child: Text(widget.titles[index],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontFamily: 'NeoGramExtended',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                        color: index == _selectedIndex
                                            ? widget.themeNotifier.titleColor
                                            : widget
                                                .themeNotifier.placeholderColor,
                                      ))),
                            ],
                          )));
                }),
          ],
        ));
  }
}
