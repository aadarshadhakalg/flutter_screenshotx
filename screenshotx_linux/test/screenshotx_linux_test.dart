import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
// import 'package:screenshotx_linux/screenshotx_linux.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:screenshotx_platform_interface/screenshotx_platform_interface.dart';

class MockScreenshotxLinuxPlatform
    with MockPlatformInterfaceMixin
    implements ScreenshotXPlatform {
  @override
  Future<Image?> captureArea(int x, int y, int height, int width) async {
    return null;
  }

  @override
  Future<Image?> captureFullScreen() async {
    return null;
  }

  @override
  Future<Color?> pickColor([int? x, int? y]) async {
    return null;
  }
}

void main() {
  // final ScreenshotxLinuxPlatform initialPlatform =
  //     ScreenshotxLinuxPlatform.instance;

  // test('$MethodChannelScreenshotxLinux is the default instance', () {
  //   expect(initialPlatform, isInstanceOf<MethodChannelScreenshotxLinux>());
  // });

  // test('getPlatformVersion', () async {
  //   ScreenshotxLinux screenshotxLinuxPlugin = ScreenshotxLinux();
  //   MockScreenshotxLinuxPlatform fakePlatform = MockScreenshotxLinuxPlatform();
  //   ScreenshotxLinuxPlatform.instance = fakePlatform;

  //   expect(await screenshotxLinuxPlugin.getPlatformVersion(), '42');
  // });
}
