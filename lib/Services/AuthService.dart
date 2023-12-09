// ignore_for_file: file_names, use_build_context_synchronously

import 'dart:convert';

import 'package:covid_tracker/Models/RegisterModel.dart';
import 'package:covid_tracker/Services/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Models/LoginModel.dart';

class AuthNetwork {
  BottomBar bottomBar = BottomBar();
  Future<LoginModel> userLogin({
    required String username,
    required String password,
    required BuildContext context,
  }) async {
    var response = await http.post(
      Uri.parse("https://covid.soykothosen.com/login"),
      body: ({
        'username': username,
        "password": password,
      }),
    );
    if (response.statusCode == 200) {
      LoginModel loginModel = LoginModel.fromJson(jsonDecode(response.body));
      return loginModel;
    } else {
      bottomBar.showSnackBarRed(context, "Login Failed");
      LoginModel loginModel = LoginModel.fromJson(jsonDecode(response.body));
      return loginModel;
    }
  }

  Future<RegisterModel> userRegister({
    required String username,
    required String password,
    required BuildContext context,
  }) async {
    var response = await http.post(
      Uri.parse("https://covid.soykothosen.com/register"),
      body: ({
        'username': username,
        "password": password,
      }),
    );
    if (response.statusCode == 200) {
      RegisterModel registerModel =
          RegisterModel.fromJson(jsonDecode(response.body));
      return registerModel;
    } else {
      bottomBar.showSnackBarRed(context, "Login Failed");
      RegisterModel registerModel =
          RegisterModel.fromJson(jsonDecode(response.body));
      return registerModel;
    }
  }
}
