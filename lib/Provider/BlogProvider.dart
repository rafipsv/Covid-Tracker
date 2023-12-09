// ignore_for_file: file_names, use_build_context_synchronously

import 'dart:io';

import 'package:covid_tracker/Models/BlogModel.dart';
import 'package:covid_tracker/Services/BlogService.dart';
import 'package:covid_tracker/Services/bottombar.dart';
import 'package:flutter/material.dart';

import '../Pages/Home Page/RootPage.dart';

// this provider class is for Fetching All Data Of Covid-19 Virus.
class BlogProvider with ChangeNotifier {
  BlogModel blogs = BlogModel();

  BlogServer blogServer = BlogServer();
  Future<void> getAllBlogs() async {
    blogs = await blogServer.getAllBlogs();
    notifyListeners();
  }

  Future<void> addBlog({
    required String title,
    required String desc,
    required File image,
    required BuildContext context,
  }) async {
    int status = await blogServer.addBlog(
      title: title,
      desc: desc,
      image: image,
      context: context,
    );
    if (status == 200) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) {
          return const RootPage();
        }),
        (route) => false,
      );
    } else {
      BottomBar bottomBar = BottomBar();
      bottomBar.showSnackBarRed(context, "Blog Adding Failed");
    }
  }

  Future<void> deleteBlog(
      {required String id, required BuildContext context}) async {
    int status = await blogServer.deleteBlog(id: id);
    if (status == 200) {
      BottomBar bottomBar = BottomBar();
      bottomBar.showSnackBarGreen(context, "Blog Deleted Successfully");
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const RootPage(),
        ),
        (route) => false,
      );
    } else {
      BottomBar bottomBar = BottomBar();
      bottomBar.showSnackBarGreen(context, "Blog Deletion Failed");
    }
    notifyListeners();
  }

  Future<void> editBlog({
    required String id,
    required String title,
    required String desc,
    required BuildContext context,
  }) async {
    if (title.isEmpty || desc.isEmpty) {
      BottomBar bottomBar = BottomBar();
      bottomBar.showSnackBarRed(context, "Every field needs to fill");
    } else {
      int status = await blogServer.editBlog(
        id: id,
        title: title,
        desc: desc,
        context: context,
      );
      if (status != 200) {
        BottomBar bottomBar = BottomBar();
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
          builder: (context) {
            return const RootPage();
          },
        ), (route) => false);
        bottomBar.showSnackBarRed(context, "Edit Failed");
        notifyListeners();
      } else {
        BottomBar bottomBar = BottomBar();
        bottomBar.showSnackBarGreen(context, "Blog Edited");
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
          builder: (context) {
            return const RootPage();
          },
        ), (route) => false);

        notifyListeners();
      }
    }
  }
}
