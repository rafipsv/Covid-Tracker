// ignore_for_file: file_names

import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';


// starting of get info widget.
class GetInfo extends StatefulWidget {
  const GetInfo({super.key});

  @override
  State<GetInfo> createState() => _GetInfoState();
}

class _GetInfoState extends State<GetInfo> {
  // defining custom spinkit widget.
  SpinKitDoubleBounce spinkit = SpinKitDoubleBounce(
    color: Colors.white,
    size: 50.sp,
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff141e30),
                Color(0xff243b55),
              ],
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 330.h),
              // showing spinkit variable.
              spinkit,
              // using sizebox for create space between spinkit widget and custom animated text.
              SizedBox(height: 80.h),
              // calling custom animated text method for loading indicator.
              customAnimatedText()
            ],
          ),
        ),
      ),
    );
  }

  Widget customAnimatedText() {
    return AnimatedTextKit(
      repeatForever: true,
      isRepeatingAnimation: true,
      animatedTexts: [
        FadeAnimatedText(
          'Loading....',
          textStyle: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              letterSpacing: 3),
        ),
        FadeAnimatedText(
          'Please Wait....',
          textStyle: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              letterSpacing: 3),
        ),
        FadeAnimatedText(
          'Getting Informations....',
          textStyle: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            letterSpacing: 3,
          ),
        ),
        FadeAnimatedText(
          'Check Your Internet....',
          textStyle: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            letterSpacing: 3,
          ),
        ),
      ],
    );
  }
}
