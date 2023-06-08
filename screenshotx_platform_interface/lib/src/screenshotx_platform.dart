import 'dart:ui';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:screenshotx_platform_interface/src/screenshotx_method_channel.dart';

abstract class ScreenshotXPlatform extends PlatformInterface {
  /// Constructs a ScreenshotxLinuxPlatform.
  ScreenshotXPlatform() : super(token: _token);

  static final Object _token = Object();

  static ScreenshotXPlatform _instance = MethodChannelScreenshotX();

  /// The default instance of [ScreenshotXPlatform] to use.
  ///
  /// Defaults to [MethodChannelScreenshotxLinux].
  static ScreenshotXPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ScreenshotXPlatform] when
  /// they register themselves.
  static set instance(ScreenshotXPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<Color?> pickColor(int x, int y);
  Future<Image?> captureFullScreen();
  Future<Image?> captureArea(int x, int y, int height, int width);
}
