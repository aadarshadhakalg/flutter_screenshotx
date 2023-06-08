import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'screenshotx_macos_platform_interface.dart';

/// An implementation of [ScreenshotxMacosPlatform] that uses method channels.
class MethodChannelScreenshotxMacos extends ScreenshotxMacosPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('screenshotx_macos');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
