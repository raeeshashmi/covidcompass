import 'package:covidtracker/models/all_countries_model.dart';
import 'package:covidtracker/screens/detail_screen.dart';
import 'package:covidtracker/services/api_service.dart';
import 'package:covidtracker/widgets/custom_country_tile.dart';
import 'package:covidtracker/widgets/custom_shimmer_effect.dart';
import 'package:covidtracker/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class AllCountriesScreen extends StatefulWidget {
  const AllCountriesScreen({super.key});

  @override
  State<AllCountriesScreen> createState() => _AllCountriesScreenState();
}

class _AllCountriesScreenState extends State<AllCountriesScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CustomTextfield(
            controller: controller,
            onChanged: (_) {
              setState(() {});
            },
          ),
          SizedBox(height: 15),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: FutureBuilder(
                future: ApiService.allCountriesApi(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CustomShimmerEffect();
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error : ${snapshot.error}'));
                  }
                  if (!snapshot.hasData) {
                    return Center(child: Text('No data available'));
                  }
                  List<AllCountriesModel> allCountriesModelList =
                      snapshot.data!;
                  return ListView.builder(
                    itemCount: allCountriesModelList.length,
                    itemBuilder: (BuildContext context, int index) {
                      AllCountriesModel allCountriesModel =
                          allCountriesModelList[index];
                      String searchedCountry = controller.text;
                      String? countryName = allCountriesModel.country;
                      String? flag = allCountriesModel.countryInfo!.flag;
                      int? cases = allCountriesModel.cases;
                      int? recovered = allCountriesModel.recovered;
                      int? deaths = allCountriesModel.deaths;
                      int? active = allCountriesModel.active;
                      int? critical = allCountriesModel.critical;
                      int? recoveredToday = allCountriesModel.todayRecovered;
                      int? deathsToday = allCountriesModel.todayDeaths;
                      if (searchedCountry.isEmpty) {
                        return CustomCountryTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                  flag: flag,
                                  countryName: countryName,
                                  cases: cases,
                                  recovered: recovered,
                                  deaths: deaths,
                                  active: active,
                                  critical: critical,
                                  recoveredToday: recoveredToday,
                                  deathsToday: deathsToday,
                                ),
                              ),
                            );
                          },
                          flag: flag,
                          countryName: countryName,
                          cases: cases,
                        );
                      } else if (countryName!
                          .toLowerCase()
                          .contains(searchedCountry.toLowerCase())) {
                        return CustomCountryTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                  flag: flag,
                                  countryName: countryName,
                                  cases: cases,
                                  recovered: recovered,
                                  deaths: deaths,
                                  active: active,
                                  critical: critical,
                                  recoveredToday: recoveredToday,
                                  deathsToday: deathsToday,
                                ),
                              ),
                            );
                          },
                          flag: flag,
                          countryName: countryName,
                          cases: cases,
                        );
                      } else {
                        return Container();
                      }
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
