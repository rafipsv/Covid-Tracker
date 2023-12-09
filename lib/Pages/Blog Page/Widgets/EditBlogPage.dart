// ignore_for_file: file_names, use_build_context_synchronously

import 'package:covid_tracker/Pages/Auth%20Pages/Widgets/Customfield.dart';
import 'package:covid_tracker/Pages/Auth%20Pages/Widgets/LoadingWidget.dart';
import 'package:covid_tracker/Provider/BlogProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../Home Page/Widgets/CustomButton.dart';

class EditBlogPage extends StatefulWidget {
  final String id;
  const EditBlogPage({super.key, required this.id});

  @override
  State<EditBlogPage> createState() => _EditBlogPageState();
}

class _EditBlogPageState extends State<EditBlogPage> {
  bool isLoading = false;
  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xff141e30),
      content: SingleChildScrollView(
        child: Column(
          children: [
            CustomField(controller: title, hintText: "Enter title..."),
            SizedBox(height: 20.h),
            CustomField(controller: desc, hintText: "Enter description..."),
            SizedBox(height: 50.h),
            Consumer<BlogProvider>(
              builder: (context, value, child) {
                return isLoading
                    ? const LoadingWidget()
                    : GestureDetector(
                        onTap: () async {
                          if (title.text.isEmpty || desc.text.isEmpty) {
                          } else {}
                          setState(() {
                            isLoading = true;
                          });
                          await value.editBlog(
                            id: widget.id,
                            title: title.text,
                            desc: desc.text,
                            context: context,
                          );
                          setState(() {
                            isLoading = false;
                          });
                        },
                        child: const CustomButton(
                          title: "Edit Blog",
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget customText() {
    return Text(
      "Do you want to log out",
      style: GoogleFonts.plusJakartaSans(
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
        color: const Color(0xff343434),
      ),
    );
  }
}
