// ignore_for_file: file_names, deprecated_member_use, use_build_context_synchronously, depend_on_referenced_packages
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:path/path.dart';
import 'package:async/async.dart';

import '../Models/BlogModel.dart';
import 'bottombar.dart';

class BlogServer {
  // This Function is for getting all Statistics Of Covid-19 Virus.
  Future<BlogModel> getAllBlogs() async {
    var response =
        await http.get(Uri.parse("https://covid.soykothosen.com/get-blog"));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      BlogModel blogModel = BlogModel.fromJson(data);
      return blogModel;
    } else {
      BlogModel blogModel = BlogModel();
      return blogModel;
    }
  }

  Future<int> addBlog({
    required String title,
    required String desc,
    required File image,
    required BuildContext context,
  }) async {
    var stream = http.ByteStream(DelegatingStream.typed(image.openRead()));
    // stream.cast();
    var length = await image.length();
    var uri = Uri.parse("https://covid.soykothosen.com/add-blog");
    var request = http.MultipartRequest('POST', uri);
    request.fields['title'] = title;
    request.fields['desc'] = desc;
    var multiport = http.MultipartFile(
      'image',
      stream,
      length,
      filename: basename(image.path),
    );
    request.files.add(multiport);
    var response = await request.send();
    if (response.statusCode == 200) {
      BottomBar bottomBar = BottomBar();
      bottomBar.showSnackBarGreen(context, "Blog Added Successful");
      return 200;
    } else {
      BottomBar bottomBar = BottomBar();
      bottomBar.showSnackBarRed(context, "Blog Added Failed");
      return 400;
    }
  }

  Future<int> deleteBlog({required String id}) async {
    var response = await http
        .delete(Uri.parse("https://covid.soykothosen.com/delete-blog?id=$id"));
    if (response.statusCode == 200) {
      return 200;
    } else {
      return 404;
    }
  }

  Future<int> editBlog({
    required String id,
    required String title,
    required String desc,
    required BuildContext context,
  }) async {
    var response = await http.patch(
      Uri.parse("https://covid.soykothosen.com/edit-blog?id=$id"),
      body: ({
        'title': title,
        "desc": desc,
      }),
    );
    if (response.statusCode == 200) {
      return 200;
    } else {
      return 400;
    }
  }
}
