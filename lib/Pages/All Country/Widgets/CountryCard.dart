// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../Provider/AllCountryProvider.dart';
import '../../Specific Country/SpecificCountry.dart';

// starting of country card widget.
class CountryCard extends StatelessWidget {
  final int index;
  final bool isSearch;
  const CountryCard({super.key, required this.index, required this.isSearch});

  @override
  Widget build(BuildContext context) {
    // declares all country provider.
    final provider = Provider.of<AllCountryProvider>(context);
    dynamic country =
        isSearch ? provider.searches[index] : provider.countries[index];
        // navigate to country details page after clicking card widget.
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return SpecificCountry(
              country: country,
              index: index,
            );
          }),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          bottom: 15.h,
          left: 10.w,
          right: 10.w,
        ),
        padding: EdgeInsets.only(
          left: 10.w,
          right: 8.w,
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
          children: [
            countryFlag(country["countryInfo"]["flag"], index.toString()),
            SizedBox(
              width: 8.w,
            ),
            customColumn(
              country["country"].toString(),
              country["cases"].toString(),
            ),
          ],
        ),
      ),
    );
  }

  Widget countryFlag(String imageUrl, String name) {
    return Hero(
      tag: name,
      child: CircleAvatar(
        maxRadius: 25.r,
        backgroundImage: NetworkImage(imageUrl),
      ),
    );
  }

  Widget customColumn(String name, String total) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            letterSpacing: 2,
            fontSize: 13.sp,
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          "Total cases : $total",
          style: GoogleFonts.roboto(
            color: Colors.white60,
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
            fontSize: 11.sp,
          ),
        ),
      ],
    );
  }
}
