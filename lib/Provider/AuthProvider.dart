// ignore_for_file: use_build_context_synchronously, unrelated_type_equality_checks, file_names

import 'package:covid_tracker/Models/RegisterModel.dart';
import 'package:covid_tracker/Pages/Auth%20Pages/LoginPage.dart';
import 'package:covid_tracker/Pages/Home%20Page/RootPage.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../Models/LoginModel.dart';
import '../Services/AuthService.dart';
import '../Services/bottombar.dart';

class AuthProvider with ChangeNotifier {
  LoginModel login = LoginModel();
  RegisterModel register = RegisterModel();

  Future<void> userLogin({
    required String username,
    required String password,
    required BuildContext context,
  }) async {
    if (username.isEmpty || password.isEmpty) {
      BottomBar bottomBar = BottomBar();
      bottomBar.showSnackBarRed(context, "Every field needs to fill");
    } else {
      AuthNetwork authNetwork = AuthNetwork();
      login = await authNetwork.userLogin(
        username: username,
        password: password,
        context: context,
      );
      if (login.status == "Failed" || login.status == "failed") {
        BottomBar bottomBar = BottomBar();
        bottomBar.showSnackBarRed(context, login.messege.toString());
        notifyListeners();
      } else {
        await setData(
          userID: login.user![0].userid!.toInt(),
          userName: login.user![0].username.toString(),
        );
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
          builder: (context) {
            return const RootPage();
          },
        ), (route) => false);

        notifyListeners();
      }
    }
  }

  Future<void> userRegister({
    required String username,
    required String password,
    required BuildContext context,
  }) async {
    if (username.isEmpty || password.isEmpty) {
      BottomBar bottomBar = BottomBar();
      bottomBar.showSnackBarRed(context, "Every field needs to fill");
    } else {
      AuthNetwork authNetwork = AuthNetwork();
      register = await authNetwork.userRegister(
        username: username,
        password: password,
        context: context,
      );
      if (register.status == "Failed" || register.status == "failed") {
        BottomBar bottomBar = BottomBar();
        bottomBar.showSnackBarRed(context, register.messege.toString());
        notifyListeners();
      } else {
        await setData(
          userID: register.user!.userId!.toInt(),
          userName: register.user!.name.toString(),
        );
        BottomBar bottomBar = BottomBar();
        bottomBar.showSnackBarGreen(context, "Registration Completed");
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
          builder: (context) {
            return const LoginPage();
          },
        ), (route) => false);

        notifyListeners();
      }
    }
  }

  Future<void> setData({required int userID, required String userName}) async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    debugPrint("UserID: $userID");
    await prefs.setInt('userID', userID);
    await prefs.setString('userName', userName);
  }
}
