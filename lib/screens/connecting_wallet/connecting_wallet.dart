// ignore: import_of_legacy_library_into_null_safe
import 'package:auto_size_text/auto_size_text.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:inflation_hedging_coin/components/theme_notifier.dart';
import 'dart:math' as math;

class ConnectingWalletScreenWidget extends StatefulWidget {
  final String title;
  final String image;

  const ConnectingWalletScreenWidget(
      {Key? key, required this.title, required this.image})
      : super(key: key);

  @override
  _ConnectingWalletScreenState createState() => _ConnectingWalletScreenState();
}

class _ConnectingWalletScreenState extends State<ConnectingWalletScreenWidget>
    with SingleTickerProviderStateMixin {
  final _themeNotifier = ThemeNotifier();
  late AnimationController _animationController;
  late Animation<double> _animation;
  double _waveRadius = 0.0;
  double _waveGap = 80.0;
  bool _showAnimation = true;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    _animationController.forward();

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reset();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // MARK: -
  // MARK: - FUNCTIONS

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    _animation = Tween(begin: 0.0, end: _waveGap).animate(_animationController)
      ..addListener(() {
        setState(() {
          _waveRadius = _animation.value;
        });
      });

    return Scaffold(
        backgroundColor: _themeNotifier.backgroundColor,
        body: SizedBox.expand(
            child: Stack(
          children: [
            /// CIRCLE ANIMATION
            _showAnimation
                ? CustomPaint(
                    size: Size(double.infinity, double.infinity),
                    painter: CircleWavePainter(_themeNotifier, _waveRadius),
                  )
                : Container(),

            /// TOKEN IMAGE
            Center(
              child: CachedNetworkImage(
                  imageUrl: 'https://thefloppa.com/ihc.png',
                  width: 80.0,
                  height: 80.0,
                  fit: BoxFit.cover),
            ),

            /// APP BAR
            Padding(
                padding: EdgeInsets.only(top: padding.top + 12.0),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width: 40.0,
                              height: 40.0,
                              child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    highlightColor: Colors.black38,
                                    onTap: () => {
                                      setState(() {
                                        _showAnimation = false;
                                      }),
                                      Navigator.pop(context)
                                    },
                                    borderRadius: BorderRadius.circular(20.0),
                                    child:
                                        Image.asset('assets/ic_arrow_back.png'),
                                  ))),
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.only(right: 40.0),
                            child: Center(
                                child: AutoSizeText('Connecting\nRainbow',
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'NeoGramExtended',
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.w700,
                                        color: _themeNotifier.titleColor))),
                          )),
                        ],
                      ),
                    )
                  ],
                )),
          ],
        )));
  }
}

class CircleWavePainter extends CustomPainter {
  final ThemeNotifier themeNotifier;
  final double waveRadius;
  var wavePaint;

  CircleWavePainter(this.themeNotifier, this.waveRadius) {
    wavePaint = Paint()
      ..color = themeNotifier.circleAnimationColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..isAntiAlias = true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2.0;
    double centerY = size.height / 2.0;
    double maxRadius = hypot(centerX, centerY);

    var currentRadius = waveRadius;
    while (currentRadius < maxRadius) {
      canvas.drawCircle(Offset(centerX, centerY), currentRadius, wavePaint);
      currentRadius += 80.0;
    }
  }

  @override
  bool shouldRepaint(CircleWavePainter oldDelegate) {
    return oldDelegate.waveRadius != waveRadius;
  }

  double hypot(double x, double y) {
    return math.sqrt(x * x + y * y);
  }
}
