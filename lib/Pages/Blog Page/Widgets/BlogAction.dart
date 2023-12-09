// ignore_for_file: file_names, use_build_context_synchronously

import 'package:covid_tracker/Pages/Blog%20Page/Widgets/EditBlogPage.dart';
import 'package:covid_tracker/Provider/BlogProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BlogAction extends StatefulWidget {
  final int index;
  const BlogAction({super.key, required this.index});

  @override
  State<BlogAction> createState() => _BlogActionState();
}

class _BlogActionState extends State<BlogAction> {
  bool isDelete = false;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          children: [
            customText(),
            SizedBox(height: 40.h),
            choiceButtons(context)
          ],
        ),
      ),
    );
  }

  Widget customText() {
    return Text(
      "What you want?",
      style: GoogleFonts.plusJakartaSans(
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
        color: const Color(0xff343434),
      ),
    );
  }

  Widget choiceButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [noButton(context), yesButton(context)],
    );
  }

  Widget noButton(BuildContext context) {
    return Consumer<BlogProvider>(
      builder: (context, value, child) {
        return isDelete
            ? Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: const CircularProgressIndicator(),
              )
            : GestureDetector(
                onTap: () async {
                  setState(() {
                    isDelete = true;
                  });
                  await value.deleteBlog(
                    id: value.blogs.blogs![widget.index].id.toString(),
                    context: context,
                  );
                  setState(() {
                    isDelete = false;
                  });
                },
                child: Container(
                  height: 40.h,
                  width: 100.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    color: const Color(0xffE51C26),
                  ),
                  child: Text(
                    "Delete Blog",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
      },
    );
  }

  Widget yesButton(BuildContext context) {
    return Consumer<BlogProvider>(
      builder: (context, value, child) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditBlogPage(
                  id: value.blogs.blogs![widget.index].id.toString(),
                ),
              ),
            );
          },
          child: Container(
            height: 40.h,
            width: 100.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              color: const Color(0xff343434),
            ),
            child: Text(
              "Edit Blog",
              style: GoogleFonts.plusJakartaSans(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
