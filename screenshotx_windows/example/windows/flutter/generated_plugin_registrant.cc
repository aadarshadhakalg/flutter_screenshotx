//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <screen_retriever/screen_retriever_plugin.h>
#include <screenshotx_windows/screenshotx_windows_plugin_c_api.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  ScreenRetrieverPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("ScreenRetrieverPlugin"));
  ScreenshotxWindowsPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("ScreenshotxWindowsPluginCApi"));
}
