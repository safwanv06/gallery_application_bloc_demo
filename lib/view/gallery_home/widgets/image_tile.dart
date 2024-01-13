import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery_application/model/image_model.dart';
import 'package:google_fonts/google_fonts.dart';

import 'image_pop_up.dart';

class ImageTile extends StatelessWidget {
   ImageTile({required this.imageFile,super.key});

   ImageModel imageFile;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(context: context, builder: (context) {
          return ImagePopUp(imageFile: imageFile.imagePath);
        },);
      },
      child: Hero(
        tag: imageFile.imagePath,
        child: Column(
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 1/1,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      image: DecorationImage(
                          image: FileImage(File(imageFile.imagePath)),fit: BoxFit.fill)),
                ),
              ),
            ),
            SizedBox(height: 4.h),
            Padding(
              padding: EdgeInsets.only(left: 32.w,right: 32.w),
              child: Text(imageFile.imageName,style: GoogleFonts.inter(fontSize: 14.sp),overflow: TextOverflow.ellipsis,),
            )
          ],
        ),
      ),
    );
  }
}
