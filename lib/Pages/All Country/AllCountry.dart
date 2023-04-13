// ignore_for_file: file_names

import 'package:covid_tracker/Pages/All%20Country/Widgets/AllCountryTopWidget.dart';
import 'package:covid_tracker/Pages/All%20Country/Widgets/LoadingShimmer.dart';
import 'package:covid_tracker/Provider/AllCountryProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'Widgets/AllCountryCard.dart';


// starting of all country widget.
class AllCountry extends StatefulWidget {
  const AllCountry({super.key});

  @override
  State<AllCountry> createState() => _AllCountryState();
}

class _AllCountryState extends State<AllCountry> {
  // declare text field controller for control search field.
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Provider.of<AllCountryProvider>(context).getAllcountry();
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
          // connects all country provider with this widget.
          child: Consumer<AllCountryProvider>(
            builder: (context, value, child) {
              return ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  // using sizedbox for create some space from top.
                  SizedBox(height: 20.h),
                  // calling all county top widget.
                  const AllCountryTopWidget(),
                  SizedBox(height: 20.h),
                  // view shimmer effect or all country card based on api value.
                  value.isShimmer
                      ? const LoadingShimmer()
                      : const AllCountryCard(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
