import 'package:flutter_test/flutter_test.dart';
import 'package:screenshotx_macos/screenshotx_macos.dart';
import 'package:screenshotx_macos/screenshotx_macos_platform_interface.dart';
import 'package:screenshotx_macos/screenshotx_macos_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockScreenshotxMacosPlatform
    with MockPlatformInterfaceMixin
    implements ScreenshotxMacosPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ScreenshotxMacosPlatform initialPlatform = ScreenshotxMacosPlatform.instance;

  test('$MethodChannelScreenshotxMacos is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelScreenshotxMacos>());
  });

  test('getPlatformVersion', () async {
    ScreenshotxMacos screenshotxMacosPlugin = ScreenshotxMacos();
    MockScreenshotxMacosPlatform fakePlatform = MockScreenshotxMacosPlatform();
    ScreenshotxMacosPlatform.instance = fakePlatform;

    expect(await screenshotxMacosPlugin.getPlatformVersion(), '42');
  });
}
