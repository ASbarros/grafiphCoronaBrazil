import 'package:covid19/providers/provider.dart';

class Country {
  String country;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int active;
  int critical;
  int casesPerOneMillion;

  Country({
    this.country,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.active,
    this.critical,
    this.casesPerOneMillion,
  });

  Country.fromJson(Map<String, dynamic> json)
      : country = json['country'],
        cases = json['cases'],
        todayCases = json['todayCases'],
        deaths = json['deaths'],
        todayDeaths = json['todayDeaths'],
        recovered = json['recovered'],
        active = json['active'],
        critical = json['critical'],
        casesPerOneMillion = json['casesPerOneMillion'];

  Map<String, dynamic> toJson() => {
        'country': this.country,
        'cases': this.cases,
        'todayCases': this.todayCases,
        'deaths': this.deaths,
        'todayDeaths': this.todayDeaths,
        'recovered': this.recovered,
        'active': this.active,
        'critical': this.critical,
        'casesPerOneMillion': this.casesPerOneMillion,
      };

  static Future<Country> getCountry(String country) async {
    var obj = await Provider.getCountry(country: country);
    return Country.fromJson(obj);
  }
}
