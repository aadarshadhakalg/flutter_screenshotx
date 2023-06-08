import 'dart:typed_data';
import 'dart:ui';

Future<Image> bytesToImage(Uint8List imgBytes) async {
  Codec codec = await instantiateImageCodec(imgBytes);
  FrameInfo frame = await codec.getNextFrame();
  return frame.image;
}
