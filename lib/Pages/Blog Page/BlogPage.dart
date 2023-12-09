// ignore_for_file: file_names, use_build_context_synchronously

import 'package:covid_tracker/Pages/Auth%20Pages/Widgets/LoadingWidget.dart';
import 'package:covid_tracker/Pages/Blog%20Page/Widgets/AddBlogPage.dart';
import 'package:covid_tracker/Pages/Blog%20Page/Widgets/BlogList.dart';
import 'package:covid_tracker/Pages/Blog%20Page/Widgets/BlogTop.dart';
import 'package:covid_tracker/Provider/AuthProvider.dart';
import 'package:covid_tracker/Provider/BlogProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  bool isLoading = true;
  String userName = "";
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final provider = Provider.of<BlogProvider>(context, listen: false);
    userName = prefs.getString("userName")!;
    await provider.getAllBlogs();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, value, child) {
        return SafeArea(
          child: Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.black,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddBlogPage(),
                  ),
                );
              },
              child: Icon(
                Icons.add,
                size: 25.sp,
              ),
            ),
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
              child: isLoading
                  ? const LoadingWidget()
                  : Column(
                      children: [
                        SizedBox(height: 20.sp),
                        BlogTop(userName: userName),
                        SizedBox(height: 50.h),
                        const BlogList()
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }

  Widget customText({required String title}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 18.sp,
            ),
          )
        ],
      ),
    );
  }
}
