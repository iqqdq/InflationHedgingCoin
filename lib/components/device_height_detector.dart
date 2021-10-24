import 'package:flutter/material.dart';

enum DeviceHeight { MEDIUM, LARGE }

class DeviceHeightDetector {
  getType() {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance!.window);
    return data.size.height <= 700.0 ? DeviceHeight.MEDIUM : DeviceHeight.LARGE;
  }
}
