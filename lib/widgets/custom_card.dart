import 'package:covidtracker/widgets/custom_row.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final int? total;
  final int? recovered;
  final int? deaths;
  final int? active;
  final int? critical;
  final int? recoveredToday;
  final int? deathsToday;
  const CustomCard({
    super.key,
    required this.total,
    required this.recovered,
    required this.deaths,
    required this.active,
    required this.critical,
    required this.recoveredToday,
    required this.deathsToday,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenHeight * 0.015,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomRow(text1: 'Total', text2: total),
            CustomRow(text1: 'Recovered', text2: recovered),
            CustomRow(text1: 'Deaths', text2: deaths),
            CustomRow(text1: 'Active', text2: active),
            CustomRow(text1: 'Critical', text2: critical),
            CustomRow(text1: 'Recovered Today', text2: recoveredToday),
            CustomRow(text1: 'Deaths Today', text2: deathsToday),
          ],
        ),
      ),
    );
  }
}
