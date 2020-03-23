import 'package:covid19/providers/provider.dart';

class World {
  String country;
  int cases;
  int deaths;
  int recovered;
  DateTime updated;

  World({
    this.country,
    this.cases,
    this.deaths,
    this.updated,
    this.recovered
  });

  World.fromJson(Map<String, dynamic> json)
      : country = json['country'],
        cases = json['cases'],
        deaths = json['deaths'],
        recovered = json['recovered'],
        updated = DateTime.fromMicrosecondsSinceEpoch(json['updated']*1000);

  Map<String, dynamic> toJson() => {
        'country': this.country,
        'cases': this.cases,
        'deaths': this.deaths,
        'recovered': this.recovered,
        'updated': this.updated,
      };

  static Future<World> getWorld() async {
    var obj = await Provider.getAll();
    return World.fromJson(obj);
  }
}
