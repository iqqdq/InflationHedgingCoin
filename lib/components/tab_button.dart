import 'dart:ui';
import 'package:flutter/material.dart';

class TabButtonWidget extends StatefulWidget {
  final bool isSelected;
  final String image;
  final String selectedImage;
  final VoidCallback onTap;

  TabButtonWidget(
      {required this.isSelected,
      required this.onTap,
      required this.image,
      required this.selectedImage});

  @override
  _TabButtonState createState() => _TabButtonState();
}

class _TabButtonState extends State<TabButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
      onTap: () => {widget.onTap()},
      child: Column(
        children: <Widget>[
          Image.asset(
            widget.isSelected ? widget.selectedImage : widget.image,
            width: 24.0,
            height: 24.0,
          ),
          SizedBox(
            height: 13.0,
          ),
          widget.isSelected
              ? Image.asset(
                  'assets/ic_tab_indicator.png',
                  width: 4.0,
                  height: 4.0,
                )
              : Container(),
        ],
      ),
    ));
  }
}
