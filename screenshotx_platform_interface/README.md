<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

# ScreenshotX Plugin Platform Interface

This platform interface provides a common interface for the [ScreenshotX](https://github.com/aadarshadhakalg/flutter_screenshotx/tree/main/screenshotx) plugin, allowing platform-specific implementations to ensure compatibility with the plugin.

## Usage
To create a new platform-specific implementation for the ScreenshotX plugin, extend the ScreenshotXPlatform interface and implement the necessary behavior for your platform. When registering your plugin, set the default platform implementation by calling ScreenshotXPlatform.instance = MyPlatformScreenshotX().