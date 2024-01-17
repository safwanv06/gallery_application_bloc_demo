import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery_application/controller/gallery_controller/controller.dart';
import 'package:gallery_application/view/gallery_home/widgets/bottom_navigation_bar_component.dart';
import 'package:gallery_application/view/gallery_home/widgets/image_tile.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/gallery_controller/bloc/gallery_bloc.dart';
import '../../model/image_model.dart';

class GalleryHomeView extends StatelessWidget {
  const GalleryHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final galleryImages = BlocProvider.of<ImageFileBloc>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(32.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("All files",
                  style: GoogleFonts.inter(
                      fontSize: 40.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w600)),
              SizedBox(
                height: 16.h,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(32.r)),
                height: 45.h,
                child: TextField(
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.only(left: 16.w, right: 16.w),
                        hintText: "Search your files")),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Text("Date Modified",
                      style: GoogleFonts.inter(
                          fontSize: 18.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.black,
                    size: 20.sp,
                  ),
                  const Spacer(),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Expanded(
                child: BlocBuilder<ImageFileBloc, List<ImageModel>>(
                    builder: (context, state) {
                  return state.isEmpty
                      ? Center(
                          child: Text(
                          "Click on add icon to capture an image.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w300,
                              color: Colors.grey),
                        ))
                      : GridView.builder(
                          shrinkWrap: true,
                          itemCount: state.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3, childAspectRatio: 1 / 1),
                          itemBuilder: (context, index) {
                            return ImageTile(imageFile: state[index]);
                          },
                        );
                }),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarComponent(
        onTap: () async {
          File? pickedFile = await imagePicker();
          if (pickedFile != null) {
            galleryImages.add(GalleryImageCapture(imagePath: pickedFile.path, imageName: pickedFile.path.split("/").last));
          }
        },
      ),
    );
  }
}
