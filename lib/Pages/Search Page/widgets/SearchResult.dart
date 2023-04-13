// ignore_for_file: file_names

import 'package:covid_tracker/Pages/All%20Country/Widgets/CountryCard.dart';
import 'package:covid_tracker/Provider/AllCountryProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AllCountryProvider>(
      builder: (context, value, child) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: value.isSearch ? 0 : value.searches.length,
          itemBuilder: (context, index) {
            return CountryCard(index: index, isSearch: true);
          },
        );
      },
    );
  }
}
