import 'dart:io';
import 'dart:ui';

import 'package:dbus/dbus.dart';
import 'package:screenshotx_platform_interface/screenshotx_platform_interface.dart';
import 'package:uuid/uuid.dart';

import 'generated/org.freedesktop.portal.Request.dart';
import 'generated/org.freedesktop.portal.Screenshot.dart';

class ScreenshotXLinux extends ScreenshotXPlatform {
  static void registerWith() {
    ScreenshotXPlatform.instance = ScreenshotXLinux();
  }

  String? _serviceName;
  final _token = const Uuid()
      .v4()
      .replaceAll('-', '')
      .replaceAll('{', '')
      .replaceAll('}', '');
  final _client = DBusClient.session();

  Future<void> _takeScreenshot() async {
    var object = OrgFreedesktopPortalScreenshot(
      _client,
      'org.freedesktop.portal.Desktop',
      path: DBusObjectPath(
        "/org/freedesktop/portal/desktop",
      ),
    );
    await object.callScreenshot(
      "",
      {
        "handle_token": DBusString(_token),
        "interactive": const DBusBoolean(false),
      },
    );
  }

  @override
  Future<Image?> captureArea(int x, int y, int height, int width) {
    // This method is not implemented, thus returns full screenshot
    return captureFullScreen();
  }

  @override
  Future<Image?> captureFullScreen() async {
    if (_serviceName == null) {
      _serviceName = await _client.nameAcquired.first;
      String formattedServiceName =
          _serviceName!.replaceAll(':', '').replaceAll('.', '_');
      _serviceName = formattedServiceName;
    }

    var request = OrgFreedesktopPortalRequest(
      _client,
      'org.freedesktop.portal.Desktop',
      path: DBusObjectPath(
          "/org/freedesktop/portal/desktop/request/$_serviceName/$_token"),
    );

    RegExp filepathReg =
        RegExp(r"(?:(?:file?|ftp):\/\/)?[\w\/\-?=%.]+\.[\w\/\-?=%.]+");

    _takeScreenshot();

    Image? image = await request.response.asyncMap((event) async {
      var screenshotPath = filepathReg
          .allMatches(event.results['uri'].toString())
          .first
          .group(0);

      if (screenshotPath != null) {
        File imageFile = File(screenshotPath.substring(7));
        Image image = await bytesToImage(imageFile.readAsBytesSync());
        return image;
      } else {
        return null;
      }
    }).first;

    return image;
  }

  @override
  Future<Color?> pickColor(int x, int y) {
    throw UnimplementedError();
  }

  void close() {
    _client.close();
  }
}
