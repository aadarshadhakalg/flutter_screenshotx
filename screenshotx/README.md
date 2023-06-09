# ScreenshotX
[![pub package](https://img.shields.io/pub/v/screenshotx.svg)](https://pub.dev/packages/screenshotx)


The ScreenshotX package provides a cross-platform solution for capturing desktop screenshots and picking colors from the screen in Flutter applications.



|             | Linux | macOS  | Windows |
|:------------|:------|:-------|:--------|
| **Support** |  ✅   |   ❌   |   ❌    |




## Features

- Capture Screenshots
- Pick Colors



## Getting started

To use the ScreenshotX plugin, add `screenshotx` as a dependency in your project's pubspec.yaml file.



## Usage

1. Capture the full screen:

```dart
Image? fullScreenImage = await screenshotX.captureFullScreen();
```

2. Pick color

```dart
Color? pickedColor = await screenshotX.pickColor();
```

For more details on using the ScreenshotX package, check out the example provided in the [example](https://github.com/aadarshadhakalg/flutter_screenshotx/tree/main/screenshotx/example) directory.

## Credits
Created by [@aadarshadhakalg](https://twitter.com/aadarshadhakalg)


Feel free to report any issues or contribute to the project on GitHub. We appreciate your feedback and contributions!
