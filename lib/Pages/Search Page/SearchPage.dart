// ignore_for_file: file_names

import 'package:covid_tracker/Pages/Search%20Page/widgets/SearchResult.dart';
import 'package:covid_tracker/Pages/Search%20Page/widgets/searchTopWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

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
              children: [
                SizedBox(height: 20.h),
                const SearchTopWidgets(),
                SizedBox(height: 20.h),
                const SearchResult()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
