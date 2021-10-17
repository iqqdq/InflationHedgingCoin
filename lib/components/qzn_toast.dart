import 'dart:async';
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';

class QZNToastWidget extends StatefulWidget {
  final ThemeNotifier themeNotifier;
  final String? image;
  final String text;
  final VoidCallback timerDidStop;

  const QZNToastWidget(
      {Key? key,
      required this.text,
      this.image,
      required this.timerDidStop,
      required this.themeNotifier})
      : super(key: key);

  @override
  _QZNToastState createState() => _QZNToastState();
}

class _QZNToastState extends State<QZNToastWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late Timer _timer;
  int _start = 3;

  @override
  void initState() {
    super.initState();

    _animationController = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 180),
    );

    _animation = new CurvedAnimation(
      parent: _animationController,
      curve: new Interval(0.0, 1.0, curve: Curves.linear),
    );

    _animationController.forward(from: 0.0);

    startTimer();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            _animationController
                .reverse()
                .then((value) => widget.timerDidStop());
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;

    return AnimatedBuilder(
        animation: _animation,
        builder: (BuildContext context, _) {
          return InkWell(
              onTap: () => {
                    _animationController
                        .reverse()
                        .then((value) => widget.timerDidStop()),
                  },
              child: Container(
                  margin: EdgeInsets.only(
                      left: 24.0,
                      top: padding.top * _animation.value,
                      right: 24.0),
                  padding: EdgeInsets.only(
                      left: 14.0, top: 10.0, bottom: 10.0, right: 14.0),
                  width: size.width,
                  height: 64.0 * _animation.value,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          widget.themeNotifier.blueGradientColor,
                          widget.themeNotifier.pinkGradientColor
                        ],
                      )),
                  child: Row(
                    children: [
                      widget.image == null
                          ? Container()
                          : Image.asset(widget.image!),
                      SizedBox(width: 14.0),
                      Expanded(
                        child: Text(widget.text,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: widget.themeNotifier.titleColor)),
                      )
                    ],
                  )));
        });
  }
}
