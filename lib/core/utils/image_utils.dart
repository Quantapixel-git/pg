import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImageUtils {
  static Future<File?> pickImage({required ImageSource imageSource}) async {
    final picker = ImagePicker();

    final image = await picker.pickImage(source: imageSource);

    if (image == null) {
      return null;
    }

    return File(image.path);
  }
}
