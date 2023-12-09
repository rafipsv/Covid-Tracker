// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomBar {
  void showSnackBarGreen(BuildContext context, String title) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 5),
      content: Text(
        title,
        style: TextStyle(
          fontSize: 15.sp,
          fontFamily: 'custom',
          fontWeight: FontWeight.w700,
          color: const Color(0xffFFFFFF),
        ),
      ),
      backgroundColor: const Color(0xff003300),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showSnackBarRed(BuildContext context, String title) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 5),
      content: Text(
        title,
        style: TextStyle(
          fontSize: 15.sp,
          fontFamily: 'custom',
          fontWeight: FontWeight.w700,
          color: const Color(0xffFFFFFF),
        ),
      ),
      backgroundColor: const Color(0xff800020),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
