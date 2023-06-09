import 'dart:ui';

import 'package:screenshotx_platform_interface/screenshotx_platform_interface.dart';

class ScreenshotX {
  Future<Image?> captureFullScreen() async {
    return ScreenshotXPlatform.instance.captureFullScreen();
  }

  Future<Image?> captureArea(int x, int y, int height, int width) async {
    return ScreenshotXPlatform.instance.captureArea(x, y, height, width);
  }

  Future<Color?> pickColor([int? x, int? y]) async {
    return ScreenshotXPlatform.instance.pickColor(x, y);
  }
}
