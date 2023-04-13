// ignore_for_file: file_names, use_build_context_synchronously

import 'package:covid_tracker/Models/GetAllStat.dart';
import 'package:covid_tracker/Services/Network.dart';
import 'package:flutter/material.dart';


// this provider class is for Fetching All Data Of Covid-19 Virus.
class AllStatProvider with ChangeNotifier {
  late AllStatModel allStats;
  bool isLoading = true;
  Network network = Network();
  void getAllStat() async {
    allStats = await network.getAllStat();
    isLoading = false;
    notifyListeners();
  }
}
