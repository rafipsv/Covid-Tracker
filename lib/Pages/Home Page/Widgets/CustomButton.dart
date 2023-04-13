// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String title;
  const CustomButton({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xff1D1E33),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(136, 165, 191, 0.48),
            blurRadius: 16,
            spreadRadius: 0,
            offset: Offset(6, 2),
          ),
          BoxShadow(
            color: Color.fromRGBO(255, 255, 255, 0.8),
            blurRadius: 16,
            spreadRadius: 0,
            offset: Offset(-6, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        title,
        style: GoogleFonts.roboto(
          color: Colors.white,
          fontWeight: FontWeight.w900,
          letterSpacing: 2,
          fontSize: 13.sp
        ),
      ),
    );
  }
}
