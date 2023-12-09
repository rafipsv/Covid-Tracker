// ignore_for_file: file_names, use_build_context_synchronously

import 'dart:io';

import 'package:covid_tracker/Pages/Auth%20Pages/Widgets/Customfield.dart';
import 'package:covid_tracker/Pages/Auth%20Pages/Widgets/LoadingWidget.dart';
import 'package:covid_tracker/Provider/BlogProvider.dart';
import 'package:covid_tracker/Services/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../Home Page/Widgets/CustomButton.dart';

class AddBlogPage extends StatefulWidget {
  const AddBlogPage({super.key});

  @override
  State<AddBlogPage> createState() => _AddBlogPageState();
}

class _AddBlogPageState extends State<AddBlogPage> {
  bool isLoading = false;
  String imagePath = "";
  final ImagePicker picker = ImagePicker();
  late XFile mainImage;
  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();
  Future<void> pickedImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imagePath = image!.path;
      mainImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xff141e30),
      content: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.h),
            photo(),
            SizedBox(height: 40.h),
            imagePath == ""
                ? Container()
                : CustomField(controller: title, hintText: "Enter title..."),
            imagePath == "" ? Container() : SizedBox(height: 20.h),
            imagePath == ""
                ? Container()
                : CustomField(
                    controller: desc, hintText: "Enter description..."),
            imagePath == "" ? Container() : SizedBox(height: 50.h),
            imagePath == ""
                ? GestureDetector(
                    onTap: () {
                      pickedImage();
                    },
                    child: const CustomButton(
                      title: "Select Photo",
                    ),
                  )
                : Consumer<BlogProvider>(
                    builder: (context, value, child) {
                      return isLoading
                          ? const LoadingWidget()
                          : GestureDetector(
                              onTap: () async {
                                if (title.text.isEmpty || desc.text.isEmpty) {
                                  Navigator.pop(context);
                                  BottomBar bottomBar = BottomBar();
                                  bottomBar.showSnackBarRed(
                                    context,
                                    "All fields needs to fill",
                                  );
                                } else {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  await value.addBlog(
                                    title: title.text,
                                    desc: desc.text,
                                    image: File(imagePath),
                                    context: context,
                                  );
                                  setState(() {
                                    isLoading = false;
                                  });
                                }
                              },
                              child: const CustomButton(
                                title: "Add Blog",
                              ),
                            );
                    },
                  ),
          ],
        ),
      ),
    );
  }

  Widget photo() {
    return Consumer<BlogProvider>(
      builder: (context, value, child) {
        return imagePath == ""
            ? defaultImage()
            : ClipOval(
                child: Image.file(
                  File(imagePath),
                  height: 100.h,
                  width: 100.h,
                  fit: BoxFit.cover,
                ),
              );
      },
    );
  }

  Widget defaultImage() {
    return Container(
      height: 100.h,
      width: 100.w,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage("assets/images/blank_image.jpg"),
          fit: BoxFit.fill,
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
