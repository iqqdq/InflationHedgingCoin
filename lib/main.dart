import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inflation_hedging_coin/screens/start/start_screen.dart';
import 'package:inflation_hedging_coin/screens/tab_controller/tab_controller_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent,
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: TabControllerScreenWidget(),
    );
  }
}
