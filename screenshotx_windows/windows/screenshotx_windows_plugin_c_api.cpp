#include "include/screenshotx_windows/screenshotx_windows_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "screenshotx_windows_plugin.h"

void ScreenshotxWindowsPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  screenshotx_windows::ScreenshotxWindowsPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
