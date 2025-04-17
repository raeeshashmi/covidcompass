import 'package:covidtracker/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String? countryName;
  final String? flag;
  final int? cases;
  final int? recovered;
  final int? deaths;
  final int? active;
  final int? critical;
  final int? recoveredToday;
  final int? deathsToday;
  const DetailScreen({
    super.key,
    required this.flag,
    required this.countryName,
    required this.cases,
    required this.recovered,
    required this.deaths,
    required this.active,
    required this.critical,
    required this.recoveredToday,
    required this.deathsToday,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(countryName!),
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
              child: CustomCard(
                total: cases,
                recovered: recovered,
                deaths: deaths,
                active: active,
                critical: critical,
                recoveredToday: recoveredToday,
                deathsToday: deathsToday,
              ),
            ),
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(flag!),
            ),
          ],
        ),
      ),
    );
  }
}
