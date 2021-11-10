library custom_switch;

import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';
import 'package:inflation_hedging_coin/screens/start/components/sprite_painter.dart';

class CircleAnimationWidget extends StatefulWidget {
  final ThemeNotifier themeNotifier;

  const CircleAnimationWidget({
    Key? key,
    required this.themeNotifier,
  }) : super(key: key);

  @override
  _CircleAnimationState createState() => _CircleAnimationState();
}

class _CircleAnimationState extends State<CircleAnimationWidget>
    with TickerProviderStateMixin {
  late AnimationController _firstAnimationController;
  late AnimationController _secondAnimationController;
  late AnimationController _thirdAnimationController;

  @override
  void initState() {
    super.initState();
    _firstAnimationController = new AnimationController(
      vsync: this,
    );
    _firstAnimationController.addListener(() {
      setState(() {});
    });

    _secondAnimationController = new AnimationController(
      vsync: this,
    );

    _thirdAnimationController = new AnimationController(
      vsync: this,
    );

    startAnimation();
  }

  @override
  void dispose() {
    _firstAnimationController.dispose();
    _secondAnimationController.dispose();
    _thirdAnimationController.dispose();
    super.dispose();
  }

  // MARK: -
  // MARK: - FUNCTION

  void startAnimation() {
    final duration = Duration(milliseconds: 1500);
    final period = Duration(seconds: 5);

    _firstAnimationController.stop();
    _firstAnimationController.reset();
    _firstAnimationController.repeat(
      period: period,
    );

    Future.delayed(
        duration,
        () => {
              _secondAnimationController.stop(),
              _secondAnimationController.reset(),
              _secondAnimationController.repeat(
                period: period,
              )
            });

    Future.delayed(
        duration * 2,
        () => {
              _thirdAnimationController.stop(),
              _thirdAnimationController.reset(),
              _thirdAnimationController.repeat(
                period: period,
              )
            });
  }

  Widget getCircleWidget(AnimationController animationController) {
    final size = MediaQuery.of(context).size;
    return CustomPaint(
        painter: SpritePainter(widget.themeNotifier, animationController),
        child: SizedBox(
          width: size.height,
          height: size.height,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      getCircleWidget(_firstAnimationController),
      getCircleWidget(_secondAnimationController),
      getCircleWidget(_thirdAnimationController)
    ]);
  }
}
