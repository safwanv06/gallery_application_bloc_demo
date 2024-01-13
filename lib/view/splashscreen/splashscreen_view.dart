import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery_application/model/image_model.dart';
import 'package:gallery_application/view/gallery_home/gallery_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/gallery_controller/bloc/gallery_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Lottie.asset(
        "assets/lottie/splashscreen_lottie.json",
        width: ScreenUtil().screenWidth / 3,
        onLoaded: (p0) async {
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          List<String>? data = sharedPreferences.getStringList("images");
          if (data != null) {
            BlocProvider.of<ImageFileBloc>(context).emit(data
                .map((e) =>
                    ImageModel(imagePath: e, imageName: e.split("/").last))
                .toList());
          }
          Timer(
            const Duration(seconds: 3),
            () {
              Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 600),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return ScaleTransition(scale: animation, child: child);
                    },
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return const GalleryHomeView();
                    },
                  ));
            },
          );
        },
      )),
    );
  }
}
