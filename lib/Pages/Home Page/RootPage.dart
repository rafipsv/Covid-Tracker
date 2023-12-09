// ignore_for_file: file_names, prefer_const_constructors
import 'package:covid_tracker/Pages/Blog%20Page/BlogPage.dart';
import 'package:covid_tracker/Pages/Home%20Page/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// this is the starting of home root Page, basically it only holds bottom navigation bars.
class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  // declaring index variable for changing pages.
  int _index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // list of pages.
    List<Widget> pages = [
      HomePage(),
      BlogPage(),
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: pages[_index],
        // declaring  bottom navigation bar.
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          elevation: 2,
          iconSize: 20.sp,
          selectedItemColor: Colors.white,
          selectedLabelStyle: GoogleFonts.plusJakartaSans(
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          unselectedLabelStyle: GoogleFonts.plusJakartaSans(
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          selectedIconTheme: IconThemeData(
            size: 22.sp,
            color: Colors.white,
          ),
          unselectedIconTheme: IconThemeData(
            size: 22.sp,
            color: Colors.white,
          ),
          unselectedItemColor: Colors.white,
          showUnselectedLabels: true,
          currentIndex: _index,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            // set value after click on bottom nav bar.
            setState(() {
              _index = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_2,
                color: Colors.white,
              ),
              label: "Blogs",
            ),
          ],
        ),
      ),
    );
  }
}
