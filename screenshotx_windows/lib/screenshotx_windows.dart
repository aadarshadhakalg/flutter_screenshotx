import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:screen_retriever/screen_retriever.dart';
import 'package:screenshotx_platform_interface/screenshotx_platform_interface.dart';

class ScreenshotxWindows extends ScreenshotXPlatform {
  final _methodChannel = const MethodChannel('screenshotx');

  @override
  Future<Image?> captureArea(int x, int y, int height, int width) async {
    Uint8List? result = await _methodChannel.invokeMethod<Uint8List?>(
      'captureScreenArea',
      <String, dynamic>{
        'x': x,
        'y': y,
        'width': width,
        'height': height,
      },
    );
    if (result != null) {
      Image image = await bytesToImage(result);
      return image;
    } else {
      return null;
    }
  }

  @override
  Future<Image?> captureFullScreen() async {
    Display screen = await ScreenRetriever.instance.getPrimaryDisplay();
    return captureArea(
        0, 0, screen.size.height.toInt(), screen.size.width.toInt());
  }

  @override
  Future<Color?> pickColor(int x, int y) async {
    Map<String, int>? result =
        await _methodChannel.invokeMethod<Map<String, int>?>(
      'pickColor',
      <String, dynamic>{
        'x': x,
        'y': y,
      },
    );
    if (result != null) {
      Color color = Color.fromRGBO(
          result["red"]!, result["green"]!, result["blue"]!, 1.0);
      return color;
    } else {
      return null;
    }
  }
}
