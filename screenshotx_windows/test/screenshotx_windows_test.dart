// import 'package:flutter_test/flutter_test.dart';
// import 'package:screenshotx_windows/screenshotx_windows.dart';
// import 'package:screenshotx_windows/screenshotx_windows_platform_interface.dart';
// import 'package:screenshotx_windows/screenshotx_windows_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// class MockScreenshotxWindowsPlatform
//     with MockPlatformInterfaceMixin
//     implements ScreenshotxWindowsPlatform {

//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }

// void main() {
//   final ScreenshotxWindowsPlatform initialPlatform = ScreenshotxWindowsPlatform.instance;

//   test('$MethodChannelScreenshotxWindows is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelScreenshotxWindows>());
//   });

//   test('getPlatformVersion', () async {
//     ScreenshotxWindows screenshotxWindowsPlugin = ScreenshotxWindows();
//     MockScreenshotxWindowsPlatform fakePlatform = MockScreenshotxWindowsPlatform();
//     ScreenshotxWindowsPlatform.instance = fakePlatform;

//     expect(await screenshotxWindowsPlugin.getPlatformVersion(), '42');
//   });
// }
