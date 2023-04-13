// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class LoadingShimmer extends StatelessWidget {
  const LoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade700,
      highlightColor: Colors.grey.shade100,
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(
            20,
            (index) => Container(
              margin: EdgeInsets.only(
                bottom: 15.h,
                left: 10.w,
                right: 10.w,
              ),
              child: Row(
                children: [
                  Container(
                    height: 50.h,
                    width: 50.w,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Column(
                    children: [
                      Container(
                        height: 10.h,
                        width: MediaQuery.of(context).size.width - 100.w,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        height: 10.h,
                        width: MediaQuery.of(context).size.width - 100.w,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
