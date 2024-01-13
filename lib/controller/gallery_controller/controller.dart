import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';


Future<File?> imagePicker() async {
  ImagePicker _picker = ImagePicker();
  final XFile? PickedFile = await _picker.pickImage(source: ImageSource.camera);
  if (PickedFile != null) {
    return await cropImage( File(PickedFile.path));
  } else {
    return null;
  }
}

Future<File?> cropImage(File pickedImage) async {
  CroppedFile? file = await ImageCropper().cropImage(
    sourcePath: pickedImage.path,
    aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
    uiSettings: [
      AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.grey,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: true,

      ),
      IOSUiSettings(
        title: 'Cropper',
      ),
    ],

  );
  if (file != null) {
    return File(file.path);
  } else {
    return null;
  }
}
