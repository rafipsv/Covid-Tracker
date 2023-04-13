// ignore_for_file: file_names, unused_local_variable

import 'dart:async';

import 'package:covid_tracker/Pages/Home%20Page/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

// starting of Splash Widget.
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  // using animation controller for animate in splash screen
  late AnimationController controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat();
  // this init state method will go homepage after 3 seconds of animation.
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
          (route) => false);
    });
  }
// using dispose for destroy controller after animation.
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // size variable declares for getting device size.
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff000000),
              Color(0xff243b55),
              Color(0xff000000),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // using empty sizebox for upper spacing
            SizedBox(height: 330.h),
            // animating splash logo.
            splashLogo(),
            // using sizebox for create gap between animated logo and custom text.
            SizedBox(height: 70.h),
            // using custom text.
            customText(),
          ],
        ),
      ),
    );
  }

  Widget splashLogo() {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Transform.rotate(
        angle: controller.value * 2.0 * math.pi,
        child: Container(
          height: 140.h,
          width: 140.w,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/virus-1.png",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget customText() {
    return Column(
      children: [
        Text(
          "Covid-19",
          style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 30.sp,
              letterSpacing: 2,
              fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 8.h),
        Text(
          "Tracker App",
          style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 30.sp,
              letterSpacing: 5,
              fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
