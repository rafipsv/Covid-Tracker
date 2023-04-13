// ignore_for_file: file_names

import 'package:covid_tracker/Pages/All%20Country/AllCountry.dart';
import 'package:covid_tracker/Pages/Home%20Page/Widgets/CustomButton.dart';
import 'package:covid_tracker/Pages/Home%20Page/Widgets/CustomCard.dart';
import 'package:covid_tracker/Pages/Home%20Page/Widgets/CustomChart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

//starting of home widget.
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, value, child) {
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
              child: Column(
                children: [
                  // sized box for upper spacing.
                  SizedBox(height: 20.h),
                  // calling custom chart widget for showing data via chart.
                  const CustomChart(),
                  // sized box for create space betwwen custom chart and custom card.
                  SizedBox(height: 40.h),
                  // custom card widget for showing data in custom card
                  const CustomCard(),
                  // using spacer for push down see all country button.
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const AllCountry();
                        }),
                      );
                    },
                    // using custom button for see all county.
                    child: const CustomButton(title: "See All Country"),
                  ),
                  SizedBox(height: 50.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
