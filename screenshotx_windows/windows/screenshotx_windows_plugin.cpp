#include "screenshotx_windows_plugin.h"

// This must be included before many other Windows headers.
#include <windows.h>

// For getPlatformVersion; remove unless needed for your plugin implementation.
#include <VersionHelpers.h>

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>
#include <flutter/standard_method_codec.h>

#include <memory>
#include <sstream>

namespace screenshotx_windows {

// static
void ScreenshotxWindowsPlugin::RegisterWithRegistrar(
    flutter::PluginRegistrarWindows *registrar) {
  auto channel =
      std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
          registrar->messenger(), "screenshotx_windows",
          &flutter::StandardMethodCodec::GetInstance());

  auto plugin = std::make_unique<ScreenshotxWindowsPlugin>();

  channel->SetMethodCallHandler(
      [plugin_pointer = plugin.get()](const auto &call, auto result) {
        plugin_pointer->HandleMethodCall(call, std::move(result));
      });

  registrar->AddPlugin(std::move(plugin));
}

ScreenshotxWindowsPlugin::ScreenshotxWindowsPlugin() {}

ScreenshotxWindowsPlugin::~ScreenshotxWindowsPlugin() {}

void ScreenshotxWindowsPlugin::HandleMethodCall(
    const flutter::MethodCall<flutter::EncodableValue> &method_call,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result) {
  if (method_call.method_name()=="captureScreenArea") {
        const auto& args = std::get<flutter::EncodableMap>(*method_call.arguments());
        auto x = std::get<int>(args.at(flutter::EncodableValue("x")));
        auto y = std::get<int>(args.at(flutter::EncodableValue("y")));
        auto width = std::get<int>(args.at(flutter::EncodableValue("width")));
        auto height = std::get<int>(args.at(flutter::EncodableValue("height")));

        auto capturedScreenArea = CaptureScreenArea(x, y, width, height);

        flutter::EncodableMap dict;
        dict[flutter::EncodableValue("buffer")] = flutter::EncodableValue(capturedScreenArea.buffer);
        dict[flutter::EncodableValue("width")] = flutter::EncodableValue(capturedScreenArea.width);
        dict[flutter::EncodableValue("height")] = flutter::EncodableValue(capturedScreenArea.height);
        dict[flutter::EncodableValue("bitsPerPixel")] = flutter::EncodableValue(capturedScreenArea.bitsPerPixel);
        dict[flutter::EncodableValue("bytesPerPixel")] = flutter::EncodableValue(capturedScreenArea.bytesPerPixel);
        result->Success(dict);
    }
    else if(method_call.method_name() == "pickColor"){
        const auto& args = std::get<flutter::EncodableMap>(*method_call.arguments());
        auto x = std::get<int>(args.at(flutter::EncodableValue("x")));
        auto y = std::get<int>(args.at(flutter::EncodableValue("y")));

        auto pickedColor = PickColor(x, y);

        flutter::EncodableMap dict;
        dict[flutter::EncodableValue("red")] = flutter::EncodableValue(pickedColor.red);
        dict[flutter::EncodableValue("green")] = flutter::EncodableValue(pickedColor.green);
        dict[flutter::EncodableValue("blue")] = flutter::EncodableValue(pickedColor.blue);
        result->Success(dict);
    }else{
        result->NotImplemented();
    }
}

CapturedScreenArea ScreenshotxWindowsPlugin::CaptureScreenArea(
        int x,
        int y,
        int width,
        int height)
{
    // Get the device context of the screen
    HDC screen = GetDC(nullptr);
    // Create a device context to use
    HDC screenMem = CreateCompatibleDC(screen);
    // Create a bitmap compatible with the screen device context
    HBITMAP dib = CreateCompatibleBitmap(screen, width, height);
    // Select the bitmap into the device context
    SelectObject(screenMem, dib);
    // Copy the bits from the screen device context into the bitmap device context
    BitBlt(screenMem, 0, 0, width, height, screen, x, y, SRCCOPY);

    BITMAPINFO bi;
    bi.bmiHeader.biSize = sizeof(bi.bmiHeader);
    bi.bmiHeader.biWidth = width;
    bi.bmiHeader.biHeight = -height; // Non-cartesian
    bi.bmiHeader.biPlanes = 1;
    bi.bmiHeader.biBitCount = 32;
    bi.bmiHeader.biCompression = BI_RGB;
    bi.bmiHeader.biSizeImage = (4*width*height);
    bi.bmiHeader.biXPelsPerMeter = 0;
    bi.bmiHeader.biYPelsPerMeter = 0;
    bi.bmiHeader.biClrUsed = 0;
    bi.bmiHeader.biClrImportant = 0;

    CapturedScreenArea capturedScreenArea;
    capturedScreenArea.buffer = std::vector<uint8_t>(4*width*height);
    capturedScreenArea.width = width;
    capturedScreenArea.height = height;
    capturedScreenArea.bitsPerPixel = 32;
    capturedScreenArea.bytesPerPixel = 4;

    // Get the bitmap bits
    GetDIBits(screenMem, dib, 0, height, capturedScreenArea.buffer.data(), &bi, DIB_RGB_COLORS);

    ReleaseDC(nullptr, screen);
    DeleteObject(dib);
    DeleteDC(screenMem);

    return capturedScreenArea;
}


PickedColor FlutterScreenCapturePlugin::PickColor(
        int x,
        int y,
       )
{
    // Get the device context of the screen
    HDC screen = GetDC(nullptr);

    COLORREF color = GetPixel(screen, x, y);

    PickedColor pickedColor;
    pickedColor.red = GetRValue(color);
    pickedColor.blue = GetBValue(color);
    pickedColor.green = GetGValue(color);


    ReleaseDC(nullptr, screen);

    return pickedColor;
}


}  // namespace screenshotx_windows
