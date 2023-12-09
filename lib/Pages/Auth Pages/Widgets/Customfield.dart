// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const CustomField(
      {super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.h,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 30.w),
      padding: EdgeInsets.only(left: 20.w),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white54,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: TextField(
        controller: controller,
        cursorColor: Colors.white,
        style: GoogleFonts.roboto(
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: hintText,
          hintStyle: GoogleFonts.roboto(
            color: Colors.white54,
            fontWeight: FontWeight.w700,
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
