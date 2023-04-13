// ignore_for_file: file_names

import 'package:animate_do/animate_do.dart';
import 'package:covid_tracker/Models/GetAllStat.dart';
import 'package:covid_tracker/Provider/AllStatProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CardData extends StatelessWidget {
  const CardData({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AllStatProvider>(builder: (context, value, child) {
      AllStatModel allStat = value.allStats;
      return Column(
        children: [
          customRow("Effected Country", allStat.affectedCountries.toString(),
              false, 1500),
          SizedBox(height: 25.h),
          customRow("Active Cases", allStat.active.toString(), false, 1500),
          SizedBox(height: 25.h),
          customRow("Total Cases", allStat.cases.toString(), false, 1800),
          SizedBox(height: 25.h),
          customRow(
              "Total Recovored", allStat.recovered.toString(), false, 2100),
          SizedBox(height: 25.h),
          customRow("In Critical Condition", allStat.critical.toString(), false,
              2400),
          SizedBox(height: 25.h),
          customRow("Total Deaths", allStat.deaths.toString(), true, 2700),
          SizedBox(height: 25.h),
          customRow("Death Per Million", allStat.deathsPerOneMillion.toString(),
              true, 3000),
        ],
      );
    });
  }

  Widget customRow(String title, String desc, bool isDeath, int duration) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FadeInLeft(
          duration: Duration(milliseconds: duration),
          child: Text(
            title,
            style: GoogleFonts.roboto(
              color: isDeath
                  ? const Color.fromARGB(255, 255, 24, 93)
                  : Colors.white,
              fontWeight: FontWeight.w900,
              letterSpacing: 2,
            ),
          ),
        ),
        FadeInRight(
          duration: Duration(milliseconds: duration),
          child: Text(
            desc,
            style: GoogleFonts.roboto(
              color: isDeath
                  ? const Color.fromARGB(255, 255, 24, 93)
                  : Colors.white,
              fontWeight: FontWeight.w900,
              letterSpacing: 2,
            ),
          ),
        ),
      ],
    );
  }
}
