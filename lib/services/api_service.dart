import 'dart:convert';

import 'package:covidtracker/models/all_countries_model.dart';
import 'package:covidtracker/models/world_states_model.dart';
import 'package:covidtracker/utils/app_url.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<WorldStatesModel> worldStateApi() async {
    var url = Uri.parse(AppUrl.worldStatesUrl);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      return WorldStatesModel.fromJson(responseBody);
    } else {
      throw Exception('Status Code : ${response.statusCode}');
    }
  }

  static Future<List<AllCountriesModel>> allCountriesApi() async {
    List<AllCountriesModel> allCountries = [];
    var url = Uri.parse(AppUrl.allCountriesUrl);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      for (Map<String, dynamic> json in responseBody) {
        allCountries.add(AllCountriesModel.fromJson(json));
      }
      return allCountries;
    } else {
      throw Exception('Status Code : ${response.statusCode}');
    }
  }
}
