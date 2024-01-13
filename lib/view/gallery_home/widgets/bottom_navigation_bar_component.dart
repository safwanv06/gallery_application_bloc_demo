import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavigationBarComponent extends StatelessWidget {
  BottomNavigationBarComponent({required this.onTap, super.key});

  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: ScreenUtil().screenHeight / 7,
        width: ScreenUtil().screenWidth,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(64.r),
                topRight: Radius.circular(64.r)),
            boxShadow: [
              BoxShadow(color: Colors.white24, blurRadius: 30.r),
              BoxShadow(color: Colors.black12, blurRadius: 40.r)
            ]),
        child: Padding(
          padding: EdgeInsets.only(left: 18.w, right: 18.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.home_outlined,
                size: 36.sp,
                color: Colors.black,
              ),
              Container(
                height: 60.h,
                width: 120.w,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(32.r)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.folder_outlined,
                        color: Colors.white,
                        size: 32.sp,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        "Files",
                        style: GoogleFonts.inter(
                            fontSize: 20.sp, color: Colors.white),
                      )
                    ]),
              ),

              Icon(
                Icons.person_2_outlined,
                size: 36.sp,
                color: Colors.black,
              ),

              InkWell(
                onTap: onTap,
                child: Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: const BoxDecoration(
                      color: Colors.black, shape: BoxShape.circle),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      size: 25.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
