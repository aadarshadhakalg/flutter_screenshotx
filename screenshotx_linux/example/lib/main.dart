import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:screenshotx_linux/screenshotx_linux.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _screenshotxLinuxPlugin = ScreenshotXLinux();
  Uint8List? imageBytes;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _screenshotxLinuxPlugin.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var image = await _screenshotxLinuxPlugin.captureFullScreen();
            if (image != null) {
              final pngBytes =
                  await image.toByteData(format: ImageByteFormat.png);
              imageBytes = Uint8List.view(pngBytes!.buffer);
            }
            setState(() {});
          },
          child: const Icon(Icons.camera),
        ),
        body: Center(
          child: imageBytes != null
              ? Image.memory(imageBytes!)
              : const Text("No Screenshot Taken"),
        ),
      ),
    );
  }
}
