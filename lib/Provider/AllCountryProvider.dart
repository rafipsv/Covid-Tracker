// ignore_for_file: file_names, avoid_print, avoid_function_literals_in_foreach_calls
import 'package:covid_tracker/Services/Network.dart';
import 'package:flutter/material.dart';

// this provider class is for Fetch All Country's Data.
class AllCountryProvider with ChangeNotifier {
  String searchCountry = "";
  String countryName = "";
  List<dynamic> countries = [];
  List<dynamic> searches = [];
  bool isShimmer = true;
  bool isSearch = false;
  Network network = Network();

  void searchCountryName(String val) {
    searchCountry = val.toLowerCase();
    countries.forEach(
      (element) {
        if (element["country"].toString().toLowerCase() == searchCountry) {
          searches.clear();
          searches.add(element);
          isSearch = true;
        } else {
          isSearch = false;
        }
      },
    );
    notifyListeners();
  }

  void getAllcountry() async {
    dynamic data = await network.getAllCountryStat();
    for (int i = 0; i < data.length; i++) {
      if (data[i] != null && data[i]["countryInfo"]["flag"] != null) {
        countries.add(data[i]);
      }
    }
    isShimmer = false;
    notifyListeners();
  }
}
