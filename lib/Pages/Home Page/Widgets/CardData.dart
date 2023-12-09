// ignore_for_file: file_names

import 'package:animate_do/animate_do.dart';
import 'package:covid_tracker/Provider/AllStatProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CardData extends StatefulWidget {
  const CardData({super.key});

  @override
  State<CardData> createState() => _CardDataState();
}

class _CardDataState extends State<CardData> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AllStatProvider>(
      builder: (context, value, child) {
        return Column(
          children: [
            value.allStats.affectedCountries == null
                ? customRow("Effected Country", "193", false, 1500)
                : customRow("Effected Country",
                    value.allStats.affectedCountries.toString(), false, 1500),
            SizedBox(height: 25.h),
            value.allStats.active == null
                ? customRow("Active Cases", "1000000", false, 1500)
                : customRow("Active Cases", value.allStats.active.toString(),
                    false, 1500),
            SizedBox(height: 25.h),
            value.allStats.cases == null
                ? customRow("Total Cases", "1000000", false, 1800)
                : customRow("Total Cases", value.allStats.cases.toString(),
                    false, 1800),
            SizedBox(height: 25.h),
            value.allStats.recovered == null
                ? customRow("Total Recovored", "1000000", false, 2100)
                : customRow("Total Recovored",
                    value.allStats.recovered.toString(), false, 2100),
            SizedBox(height: 25.h),
            value.allStats.critical == null
                ? customRow("In Critical Condition", "1000000", false, 2400)
                : customRow("In Critical Condition",
                    value.allStats.critical.toString(), false, 2400),
            SizedBox(height: 25.h),
            value.allStats.deaths == null
                ? customRow("Total Deaths", "1000000", true, 2700)
                : customRow("Total Deaths", value.allStats.deaths.toString(),
                    true, 2700),
            SizedBox(height: 25.h),
            value.allStats.deathsPerOneMillion == null
                ? customRow("Death Per Million", "1000000", true, 3000)
                : customRow("Death Per Million",
                    value.allStats.deathsPerOneMillion.toString(), true, 3000),
          ],
        );
      },
    );
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
