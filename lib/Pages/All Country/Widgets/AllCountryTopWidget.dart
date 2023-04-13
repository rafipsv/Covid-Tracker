// ignore_for_file: file_names

import 'package:covid_tracker/Pages/Search%20Page/SearchPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AllCountryTopWidget extends StatelessWidget {
  const AllCountryTopWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Row(
        children: [
          animatedEarth(),
          SizedBox(width: 20.w),
          searchField(context),
        ],
      ),
    );
  }

  Widget animatedEarth() {
    return Image.asset(
      "assets/images/earth.png",
      height: 50.h,
      width: 50.w,
    );
  }

  Widget searchField(BuildContext context) {
    return Container(
      width: 220.w,
      height: 50.h,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white54,
          ),
          borderRadius: BorderRadius.circular(8.r)),
      child: TextField(
        readOnly: true,
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: "Search...",
          hintStyle: GoogleFonts.roboto(
            color: Colors.white54,
            fontWeight: FontWeight.w700,
          ),
          contentPadding: EdgeInsets.only(
            left: 10.w,
            bottom: 15.h,
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SearchPage(),
            ),
          );
        },
      ),
    );
  }
}
