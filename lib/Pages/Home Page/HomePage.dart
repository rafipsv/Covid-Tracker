// ignore_for_file: file_names, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:covid_tracker/Pages/Home%20Page/Home.dart';
import 'package:covid_tracker/Pages/Loading%20Page/GetInfo.dart';
import 'package:covid_tracker/Provider/AllStatProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// starting of homepage widget.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<AllStatProvider>(context, listen: false);
    provider.getAllStat();
  }

  @override
  Widget build(BuildContext context) {
    // calling this method through the provider for getting realtime data using api.

    // connext widget to allStatProvider through consumer.
    return Consumer<AllStatProvider>(
      builder: (context, value, child) {
        // returing get info loading value or homepage depends on proper api call and data.
        return value.isLoading ? const GetInfo() : const Home();
      },
    );
  }
}
