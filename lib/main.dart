// ignore_for_file: prefer_const_constructors

import 'package:covid_tracker/Pages/Splash%20Page/Splash.dart';
import 'package:covid_tracker/Provider/AllCountryProvider.dart';
import 'package:covid_tracker/Provider/AllStatProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

// Starting Of This Covid Tracker App
void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(const MyApp());
}

// this is App's first class
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // using screen Utils for responsive desing
    return ScreenUtilInit(
      builder: ((context, child) {
        // using provider for better state management.
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => AllStatProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => AllCountryProvider(),
            )
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Splash(),
          ),
        );
      }),
      // declaring ideal design size.
      designSize: Size(
        360,
        800,
      ),
    );
  }
}
