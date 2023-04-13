// ignore_for_file: file_names
import 'package:covid_tracker/Pages/All%20Country/Widgets/CountryCard.dart';
import 'package:covid_tracker/Provider/AllCountryProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


// starting of all country card Widget.
class AllCountryCard extends StatefulWidget {
  const AllCountryCard({
    super.key,
  });

  @override
  State<AllCountryCard> createState() => _AllCountryCardState();
}

class _AllCountryCardState extends State<AllCountryCard> {
  @override
  Widget build(BuildContext context) {
    // connect all country provider to this widget.
    return Consumer<AllCountryProvider>(builder: (context, value, child) {
      return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: value.countries.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return CountryCard(
              index: index,
              isSearch: false,
            );
          },
        ),
      );
    });
  }
}
