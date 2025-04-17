class AllCountriesModel {
  int? updated;
  String? country;
  CountryInfo? countryInfo;
  int? cases;
  int? todayCases;
  int? deaths;
  int? todayDeaths;
  int? recovered;
  int? todayRecovered;
  int? active;
  int? critical;
  double? casesPerOneMillion;
  double? deathsPerOneMillion;
  int? tests;
  double? testsPerOneMillion;
  int? population;
  String? continent;
  int? oneCasePerPeople;
  int? oneDeathPerPeople;
  int? oneTestPerPeople;
  double? activePerOneMillion;
  double? recoveredPerOneMillion;
  double? criticalPerOneMillion;

  AllCountriesModel({
    this.updated,
    this.country,
    this.countryInfo,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.todayRecovered,
    this.active,
    this.critical,
    this.casesPerOneMillion,
    this.deathsPerOneMillion,
    this.tests,
    this.testsPerOneMillion,
    this.population,
    this.continent,
    this.oneCasePerPeople,
    this.oneDeathPerPeople,
    this.oneTestPerPeople,
    this.activePerOneMillion,
    this.recoveredPerOneMillion,
    this.criticalPerOneMillion,
  });

  AllCountriesModel.fromJson(Map<String, dynamic> json) {
    updated = json['updated'];
    country = json['country'];
    countryInfo = json['countryInfo'] != null
        ? CountryInfo.fromJson(json['countryInfo'])
        : null;
    cases = (json['cases'] as num?)?.toInt();
    todayCases = (json['todayCases'] as num?)?.toInt();
    deaths = (json['deaths'] as num?)?.toInt();
    todayDeaths = (json['todayDeaths'] as num?)?.toInt();
    recovered = (json['recovered'] as num?)?.toInt();
    todayRecovered = (json['todayRecovered'] as num?)?.toInt();
    active = (json['active'] as num?)?.toInt();
    critical = (json['critical'] as num?)?.toInt();
    casesPerOneMillion = (json['casesPerOneMillion'] as num?)?.toDouble();
    deathsPerOneMillion = (json['deathsPerOneMillion'] as num?)?.toDouble();
    tests = (json['tests'] as num?)?.toInt();
    testsPerOneMillion = (json['testsPerOneMillion'] as num?)?.toDouble();
    population = (json['population'] as num?)?.toInt();
    continent = json['continent'];
    oneCasePerPeople = (json['oneCasePerPeople'] as num?)?.toInt();
    oneDeathPerPeople = (json['oneDeathPerPeople'] as num?)?.toInt();
    oneTestPerPeople = (json['oneTestPerPeople'] as num?)?.toInt();
    activePerOneMillion = (json['activePerOneMillion'] as num?)?.toDouble();
    recoveredPerOneMillion =
        (json['recoveredPerOneMillion'] as num?)?.toDouble();
    criticalPerOneMillion = (json['criticalPerOneMillion'] as num?)?.toDouble();
  }
}

class CountryInfo {
  int? iId;
  String? iso2;
  String? iso3;
  double? lat;
  double? long;
  String? flag;

  CountryInfo({this.iId, this.iso2, this.iso3, this.lat, this.long, this.flag});

  CountryInfo.fromJson(Map<String, dynamic> json) {
    iId = json['_id'];
    iso2 = json['iso2'];
    iso3 = json['iso3'];
    lat = (json['lat'] as num?)?.toDouble();
    long = (json['long'] as num?)?.toDouble();
    flag = json['flag'];
  }
}
