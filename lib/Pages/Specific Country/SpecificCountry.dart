// ignore_for_file: file_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


// starting of Specific Country widget.
class SpecificCountry extends StatelessWidget {
  final dynamic country;
  final int index;
  const SpecificCountry(
      {super.key, required this.country, required this.index});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 60.h),
                countryFlag(
                  country["countryInfo"]["flag"],
                  index.toString(),
                  country["country"],
                ),
                SizedBox(height: 30.h),
                customCard(
                  "Population",
                  country["population"].toString(),
                  "assets/images/population.png",
                  false,
                ),
                customCard(
                  "Total Cases",
                  country["cases"].toString(),
                  "assets/images/total.png",
                  false,
                ),
                customCard(
                  "Active Cases",
                  country["active"].toString(),
                  "assets/images/active.png",
                  false,
                ),
                customCard(
                  "Total Recovered",
                  country["recovered"].toString(),
                  "assets/images/recovered.png",
                  false,
                ),
                customCard(
                  "Critical",
                  country["critical"].toString(),
                  "assets/images/critical.png",
                  false,
                ),
                customCard(
                  "Total Deaths",
                  country["deaths"].toString(),
                  "assets/images/death.png",
                  true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget countryFlag(
    String url,
    String tag,
    String name,
  ) {
    return Column(
      children: [
        Hero(
          tag: tag,
          child: Container(
            height: 50.h,
            width: 90.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(url),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          name,
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

  Widget customCard(
    String title,
    String number,
    String imageUrl,
    bool isDead,
  ) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 20.h,
        left: 10.w,
        right: 10.w,
      ),
      padding: EdgeInsets.only(
        left: 15.w,
        right: 15.w,
        top: 10.h,
        bottom: 10.h,
      ),
      decoration: BoxDecoration(
        color: const Color(0xff1D1E33),
        border: Border.all(
          color: const Color.fromRGBO(136, 165, 191, 0.48),
        ),
        borderRadius: BorderRadius.circular(6.r),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(136, 165, 191, 0.48),
            blurRadius: 16,
            spreadRadius: 0,
            offset: Offset(4, 2),
          ),
          BoxShadow(
            color: Color.fromRGBO(255, 255, 255, 0.8),
            blurRadius: 16,
            spreadRadius: 0,
            offset: Offset(-3, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                number,
                style: GoogleFonts.roboto(
                  color: isDead
                      ? const Color.fromARGB(255, 255, 24, 93)
                      : Colors.white,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2,
                  fontSize: 18.sp,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                title,
                style: GoogleFonts.roboto(
                    color: isDead
                      ? const Color.fromARGB(255, 255, 24, 93)
                      : Colors.white54,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2,
                  fontSize: 15.sp,
                ),
              )
            ],
          ),
          Container(
            height: 45.h,
            width: 50.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  imageUrl,
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
