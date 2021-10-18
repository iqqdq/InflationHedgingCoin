import 'package:flutter/material.dart';

class UnfocusWidget extends StatelessWidget {
  final Widget child;

  const UnfocusWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          width: size.width,
          height: double.infinity,
          color: Colors.transparent,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              child,
            ],
          ),
        ));
  }
}
