// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object lib/org.freedesktop.portal.Screenshot.xml

import 'package:dbus/dbus.dart';

class OrgFreedesktopPortalScreenshot extends DBusRemoteObject {
  OrgFreedesktopPortalScreenshot(DBusClient client, String destination,
      {DBusObjectPath path = const DBusObjectPath.unchecked('/')})
      : super(client, name: destination, path: path);

  /// Gets org.freedesktop.portal.Screenshot.version
  Future<int> getversion() async {
    var value = await getProperty(
        'org.freedesktop.portal.Screenshot', 'version',
        signature: DBusSignature('u'));
    return value.asUint32();
  }

  /// Invokes org.freedesktop.portal.Screenshot.Screenshot()
  Future<DBusObjectPath> callScreenshot(
      String parentWindow, Map<String, DBusValue> options,
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    var result = await callMethod(
        'org.freedesktop.portal.Screenshot',
        'Screenshot',
        [DBusString(parentWindow), DBusDict.stringVariant(options)],
        replySignature: DBusSignature('o'),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
    return result.returnValues[0].asObjectPath();
  }

  /// Invokes org.freedesktop.portal.Screenshot.PickColor()
  Future<DBusObjectPath> callPickColor(
      String parentWindow, Map<String, DBusValue> options,
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    var result = await callMethod(
        'org.freedesktop.portal.Screenshot',
        'PickColor',
        [DBusString(parentWindow), DBusDict.stringVariant(options)],
        replySignature: DBusSignature('o'),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
    return result.returnValues[0].asObjectPath();
  }
}
