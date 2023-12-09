// ignore_for_file: file_names, use_build_context_synchronously

import 'package:covid_tracker/Pages/Blog%20Page/Widgets/AddBlogPage.dart';
import 'package:covid_tracker/Provider/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BlogDetails extends StatelessWidget {
  final String title;
  final String desc;
  final String imageUrl;
  const BlogDetails(
      {super.key,
      required this.title,
      required this.desc,
      required this.imageUrl});

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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20.sp),
                    imageBox(context: context),
                    SizedBox(height: 20.sp),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Text(
                        title,
                        style: GoogleFonts.plusJakartaSans(
                          color: Colors.white,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w700,
                          fontSize: 22.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.sp),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Text(
                        desc,
                        style: GoogleFonts.plusJakartaSans(
                          color: Colors.white54,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                  ],
                ),
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

  Widget imageBox({required BuildContext context}) {
    return Container(
      height: 300.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            imageUrl,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
