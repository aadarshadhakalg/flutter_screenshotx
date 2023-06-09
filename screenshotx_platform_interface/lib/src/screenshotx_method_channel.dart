import 'package:flutter/services.dart';
import 'dart:ui';

import 'bytes_to_image.dart';
import 'screenshotx_platform.dart';

class MethodChannelScreenshotX implements ScreenshotXPlatform {
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
    Uint8List? result = await _methodChannel.invokeMethod<Uint8List?>(
      'captureFullScreen',
    );
    if (result != null) {
      Image image = await bytesToImage(result);
      return image;
    } else {
      return null;
    }
  }

  @override
  Future<Color?> pickColor([int? x, int? y]) async {
    assert(x != null);
    assert(y != null);
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
