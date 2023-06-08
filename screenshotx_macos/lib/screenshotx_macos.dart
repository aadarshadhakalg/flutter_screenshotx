
import 'screenshotx_macos_platform_interface.dart';

class ScreenshotxMacos {
  Future<String?> getPlatformVersion() {
    return ScreenshotxMacosPlatform.instance.getPlatformVersion();
  }
}
