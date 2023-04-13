// ignore_for_file: file_names
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/GetAllStat.dart';

class Network {
  static const url = "https://disease.sh/v3/covid-19/all";
  static const url2 = "https://disease.sh/v3/covid-19/countries";
  // This Function is for getting all Statistics Of Covid-19 Virus.
  Future<AllStatModel> getAllStat() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      AllStatModel allStatModel = AllStatModel.fromJson(data);
      return allStatModel;
    } else {
      AllStatModel allStatModel2 = AllStatModel();
      return allStatModel2;
    }
  }

//This Function is for Getting All Country's Data.
  Future<List<dynamic>> getAllCountryStat() async {
    var response = await http.get(Uri.parse(url2));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      return [];
    }
  }
}
