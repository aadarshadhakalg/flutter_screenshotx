import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'screenshotx_macos_method_channel.dart';

abstract class ScreenshotxMacosPlatform extends PlatformInterface {
  /// Constructs a ScreenshotxMacosPlatform.
  ScreenshotxMacosPlatform() : super(token: _token);

  static final Object _token = Object();

  static ScreenshotxMacosPlatform _instance = MethodChannelScreenshotxMacos();

  /// The default instance of [ScreenshotxMacosPlatform] to use.
  ///
  /// Defaults to [MethodChannelScreenshotxMacos].
  static ScreenshotxMacosPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ScreenshotxMacosPlatform] when
  /// they register themselves.
  static set instance(ScreenshotxMacosPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
