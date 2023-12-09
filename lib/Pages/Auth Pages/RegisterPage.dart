// ignore_for_file: file_names

import 'package:covid_tracker/Pages/Auth%20Pages/LoginPage.dart';
import 'package:covid_tracker/Pages/Auth%20Pages/Widgets/Customfield.dart';
import 'package:covid_tracker/Pages/Auth%20Pages/Widgets/LoadingWidget.dart';
import 'package:covid_tracker/Provider/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Home Page/Widgets/CustomButton.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isLoading = false;
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, value, child) {
        return SafeArea(
          child: Scaffold(
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
                    const SizedBox(
                      height: 50,
                    ),
                    customImage(),
                    const SizedBox(
                      height: 50,
                    ),
                    customText(title: "Enter username"),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomField(controller: userName, hintText: "Username..."),
                    const SizedBox(
                      height: 50,
                    ),
                    customText(title: "Enter password"),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomField(controller: password, hintText: "password..."),
                    const SizedBox(
                      height: 20,
                    ),
                    customText2(title: "Already have an account?"),
                    SizedBox(height: 160.h),
                    isLoading
                        ? const LoadingWidget()
                        : GestureDetector(
                            onTap: () async {
                              setState(() {
                                isLoading = true;
                              });
                              await value.userRegister(
                                  username: userName.text,
                                  password: password.text,
                                  context: context);
                              setState(() {
                                isLoading = false;
                              });
                            },
                            // using custom button for see all county.
                            child: const CustomButton(title: "Register"),
                          ),
                    SizedBox(height: 50.h),
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
            style: GoogleFonts.plusJakartaSans(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 18.sp,
            ),
          )
        ],
      ),
    );
  }

  Widget customText2({required String title}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: GestureDetector(
        onTap: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
            (route) => false,
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title,
              style: GoogleFonts.plusJakartaSans(
                color: Colors.white54,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
            ),
            Text(
              "  Login",
              style: GoogleFonts.plusJakartaSans(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 14.sp,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget customImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/death.png",
          height: 150.h,
          width: 150.w,
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}
