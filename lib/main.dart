import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery_application/view/splashscreen/splashscreen_view.dart';

import 'controller/gallery_controller/bloc/gallery_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 844),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ImageFileBloc(),)
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Gallery',
          theme: ThemeData(
            useMaterial3: true,
          ),
          home:child,
        ),
      ),
      child: const SplashScreen(),
    );
  }
}
