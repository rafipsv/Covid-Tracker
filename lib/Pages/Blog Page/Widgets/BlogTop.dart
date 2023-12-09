// ignore_for_file: file_names, use_build_context_synchronously

import 'package:covid_tracker/Pages/Auth%20Pages/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Services/bottombar.dart';

class BlogTop extends StatelessWidget {
  final String userName;
  const BlogTop({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          customText(title: userName),
          IconButton(
            onPressed: () {
              logOut(context);
            },
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
              size: 25.sp,
            ),
          )
        ],
      ),
    );
  }

  Widget customText({required String title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
            fontSize: 20.sp,
          ),
        )
      ],
    );
  }

  void logOut(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('userID', 0);
    await prefs.setString('userName', "");
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
      (route) => false,
    );
    BottomBar bottomBar = BottomBar();
    bottomBar.showSnackBarRed(context, "Logged Out Successfully");
  }
}
