#ifndef FLUTTER_PLUGIN_SCREENSHOTX_WINDOWS_PLUGIN_H_
#define FLUTTER_PLUGIN_SCREENSHOTX_WINDOWS_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace screenshotx_windows {

struct PickedColor {
  int red;
  int green;
  int blue;
};

struct CapturedScreenArea {
  std::vector<uint8_t> buffer;
  int width;
  int height;
  int bitsPerPixel;
  int bytesPerPixel;
};

class ScreenshotxWindowsPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  ScreenshotxWindowsPlugin();

  virtual ~ScreenshotxWindowsPlugin();

  // Disallow copy and assign.
  ScreenshotxWindowsPlugin(const ScreenshotxWindowsPlugin&) = delete;
  ScreenshotxWindowsPlugin& operator=(const ScreenshotxWindowsPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);

static CapturedScreenArea CaptureScreenArea(
        int x,
        int y,
        int width,
        int height
    );
};

}  // namespace screenshotx_windows

#endif  // FLUTTER_PLUGIN_SCREENSHOTX_WINDOWS_PLUGIN_H_
