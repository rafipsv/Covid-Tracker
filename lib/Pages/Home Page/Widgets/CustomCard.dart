// ignore_for_file: file_names

import 'package:covid_tracker/Pages/Home%20Page/Widgets/CardData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 24.w,
        right: 24.w,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 15.h,
        horizontal: 15.w,
      ),
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
      child: const CardData(),
    );
  }
}
