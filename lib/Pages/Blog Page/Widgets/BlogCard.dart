// ignore_for_file: file_names, sized_box_for_whitespace

import 'package:covid_tracker/Pages/Blog%20Page/Widgets/BlogAction.dart';
import 'package:covid_tracker/Pages/Blog%20Page/Widgets/BlogDetails.dart';
import 'package:covid_tracker/Provider/BlogProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:marquee_text/marquee_text.dart';

// starting of country card widget.
class BlogCard extends StatelessWidget {
  final int index;
  const BlogCard({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<BlogProvider>(
      builder: (context, value, child) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlogDetails(
                  title: value.blogs.blogs![index].title.toString(),
                  desc: value.blogs.blogs![index].des.toString(),
                  imageUrl: value.blogs.blogs![index].image.toString(),
                ),
              ),
            );
          },
          onLongPress: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlogAction(
                  index: index,
                ),
              ),
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
                countryFlag(value.blogs.blogs![index].image.toString()),
                SizedBox(
                  width: 8.w,
                ),
                customColumn(
                  value.blogs.blogs![index].title.toString(),
                  value.blogs.blogs![index].des.toString(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget countryFlag(
    String imageUrl,
  ) {
    return CircleAvatar(
      maxRadius: 25.r,
      backgroundImage: NetworkImage(imageUrl),
    );
  }

  Widget customColumn(String name, String total) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 250.w,
          child: MarqueeText(
            text: TextSpan(
              text: name,
            ),
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              letterSpacing: 2,
              fontSize: 13.sp,
            ),
            speed: 30,
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Container(
          width: 250.w,
          child: MarqueeText(
            text: TextSpan(
              text: total,
            ),
            style: GoogleFonts.roboto(
              color: Colors.white60,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
              fontSize: 11.sp,
            ),
            speed: 20,
          ),
        ),
      ],
    );
  }
}
