import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImagePopUp extends StatelessWidget {
  ImagePopUp({required this.imageFile, super.key});

  String imageFile;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
          tag: imageFile,
          child: Padding(
            padding:  EdgeInsets.only(left: 32.w,right: 32.w),
            child: AspectRatio(
              aspectRatio: 1/1,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    image: DecorationImage(image: FileImage(File(imageFile)))),
              ),
            ),
          )),
    );
  }
}
