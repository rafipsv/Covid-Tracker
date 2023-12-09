// ignore_for_file: file_names, unnecessary_null_comparison

import 'package:covid_tracker/Provider/AllStatProvider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomChart extends StatefulWidget {
  const CustomChart({super.key});

  @override
  State<CustomChart> createState() => _CustomChartState();
}

class _CustomChartState extends State<CustomChart> {
  Map<String, double> dataMap = {};
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorList = <Color>[
      const Color(0xff0000FF),
      const Color(0xff00D100),
      const Color(0xffD10000),
    ];

    return Consumer<AllStatProvider>(
      builder: (context, value, child) {
        if (value.allStats.active == null) {
          dataMap = {
            "Total": 1000,
            "Recovered": 980,
            "Deaths": 20,
          };
        } else {
          dataMap = {
            "Total": value.allStats.cases!.toDouble(),
            "Recovered": value.allStats.recovered!.toDouble(),
            "Deaths": value.allStats.deaths!.toDouble(),
          };
        }
        return PieChart(
          dataMap: dataMap,
          animationDuration: const Duration(milliseconds: 1200),
          chartLegendSpacing: 35.w,
          chartRadius: MediaQuery.of(context).size.width / 3.2,
          colorList: colorList,
          initialAngleInDegree: 0,
          chartType: ChartType.ring,
          ringStrokeWidth: 32,
          legendOptions: LegendOptions(
            showLegendsInRow: false,
            legendPosition: LegendPosition.right,
            showLegends: true,
            legendTextStyle: GoogleFonts.roboto(
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: 2,
            ),
          ),
          chartValuesOptions: const ChartValuesOptions(
            showChartValueBackground: true,
            showChartValues: true,
            showChartValuesInPercentage: true,
            showChartValuesOutside: false,
            decimalPlaces: 1,
          ),
        );
      },
    );
  }
}
