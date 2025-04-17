import 'package:covidtracker/models/world_states_model.dart';
import 'package:covidtracker/screens/all_countries_screen.dart';
import 'package:covidtracker/services/api_service.dart';
import 'package:covidtracker/widgets/custom_button.dart';
import 'package:covidtracker/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatesScreen extends StatelessWidget {
  const WorldStatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: FutureBuilder(
        future: ApiService.worldStateApi(),
        builder: (context, AsyncSnapshot<WorldStatesModel> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: SpinKitFadingCircle(color: Colors.white));
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error : ${snapshot.hasError}'));
          }
          if (!snapshot.hasData) {
            return Center(child: Text('No data available'));
          }
          WorldStatesModel worldStatesModel = snapshot.data!;
          int? cases = worldStatesModel.cases;
          int? recovered = worldStatesModel.recovered;
          int? deaths = worldStatesModel.deaths;
          int? active = worldStatesModel.active;
          int? critical = worldStatesModel.critical;
          int? todayRecovered = worldStatesModel.todayRecovered;
          int? todayDeaths = worldStatesModel.todayDeaths;
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PieChart(
                    dataMap: {
                      'Total': double.parse(cases.toString()),
                      'Recovered': double.parse(recovered.toString()),
                      'Deaths': double.parse(deaths.toString()),
                    },
                    colorList: [Colors.blue, Colors.green, Colors.red],
                    chartType: ChartType.ring,
                    legendOptions: LegendOptions(
                      legendPosition: LegendPosition.left,
                    ),
                    chartValuesOptions: ChartValuesOptions(
                      showChartValuesInPercentage: true,
                    ),
                  ),
                  CustomCard(
                    total: cases,
                    recovered: recovered,
                    deaths: deaths,
                    active: active,
                    critical: critical,
                    recoveredToday: todayRecovered,
                    deathsToday: todayDeaths,
                  ),
                  CustomButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllCountriesScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
