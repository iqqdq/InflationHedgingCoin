import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inflation_hedging_coin/screens/tab_controller/tab_controller_screen.dart';

void main() {
  // Status bar color (dark)
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent,
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabControllerScreenWidget(),
    );
  }
}
