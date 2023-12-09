// ignore_for_file: prefer_const_constructors

import 'package:covid_tracker/Pages/Home%20Page/RootPage.dart';
import 'package:covid_tracker/Pages/Splash%20Page/Splash.dart';
import 'package:covid_tracker/Provider/AllCountryProvider.dart';
import 'package:covid_tracker/Provider/AllStatProvider.dart';
import 'package:covid_tracker/Provider/AuthProvider.dart';
import 'package:covid_tracker/Provider/BlogProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Pages/Auth Pages/Widgets/LoadingWidget.dart';

// Starting Of This Covid Tracker App
void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(const MyApp());
}

// this is App's first class
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoading = true;
  int index = 0;
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getInt('userID') == null || prefs.getInt('userID') == 0) {
      index = 0;
    } else {
      index = prefs.getInt('userID')!;
    }
    isLoading = false;
    setState(() {});
  }

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
            ),
            ChangeNotifierProvider(
              create: (_) => AuthProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => BlogProvider(),
            )
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: isLoading
                ? const LoadingWidget()
                : index == 0
                    ? const Splash()
                    : const RootPage(),
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
