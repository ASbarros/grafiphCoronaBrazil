import 'package:covid19/models/world.model.dart';
import 'package:covid19/models/country.model.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title, this.country, this.world}) : super(key: key);

  final String title;
  final World world;
  final Country country;

  @override
  _HomePageState createState() =>
      _HomePageState(world: world, country: country);
}

class _HomePageState extends State<HomePage> {
  World world;
  Country country;
  String title = 'Atualizado em:\n';
  String date = '';
  String message1 = '';
  String message2 = '';
  String message3 = '';
  String message4 = '';

  List<charts.Series<Country, String>> _seriesData1 =
      List<charts.Series<Country, String>>();
  List<charts.Series<Country, String>> _seriesData2 =
      List<charts.Series<Country, String>>();
  List<charts.Series<Country, String>> _seriesData3 =
      List<charts.Series<Country, String>>();

  _HomePageState({this.world, this.country});

  _generateData() {
    message1 = 'Brasil: ${country.cases}, mundo: ${world.cases}';
    var data1 = [
      Country(cases: country.cases, country: 'brasil'),
      Country(cases: world.cases, country: 'world'),
    ];
    message2 = 'Brasil: ${country.deaths}, mundo: ${world.deaths}';
    var data2 = [
      Country(deaths: world.deaths, country: 'world'),
      Country(deaths: country.deaths, country: 'brasil'),
    ];
    message3 = 'Brasil: ${country.recovered}, mundo: ${world.recovered}';
    var data3 = [
      Country(recovered: world.recovered, country: 'world'),
      Country(recovered: country.recovered, country: 'brasil'),
    ];

    _seriesData1.add(
      charts.Series(
        domainFn: (Country country, _) => country.country,
        measureFn: (Country country, _) => country.cases,
        id: 'Mundo',
        data: data1,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Country country, _) =>
            charts.ColorUtil.fromDartColor(Colors.amberAccent),
      ),
    );
    _seriesData2.add(
      charts.Series(
        domainFn: (Country country, _) => country.country,
        measureFn: (Country country, _) => country.deaths,
        id: 'Brasil',
        data: data2,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Country country, _) =>
            charts.ColorUtil.fromDartColor(Colors.amberAccent),
      ),
    );
    _seriesData3.add(
      charts.Series(
        domainFn: (Country country, _) => country.country,
        measureFn: (Country country, _) => country.recovered,
        id: 'Brasil',
        data: data3,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Country country, _) =>
            charts.ColorUtil.fromDartColor(Colors.amberAccent),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _seriesData1 = List<charts.Series<Country, String>>();
    _seriesData2 = List<charts.Series<Country, String>>();
    _seriesData3 = List<charts.Series<Country, String>>();
    date = formatDate(DateTime.parse(world.updated.toString()),
        [dd, '/', mm, '/', yyyy, ' ', hh, ':', nn]);
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(120, 0, 0, 255),
          bottom: TabBar(
            indicatorColor: Color.fromARGB(255, 0, 0, 0),
            tabs: [Text('Casos'), Text('Mortes'), Text('Recuperados')],
          ),
          title: Text(title + date),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Tooltip(
                          message: message1,
                          child: charts.BarChart(
                            _seriesData1,
                            animate: true,
                            barGroupingType: charts.BarGroupingType.grouped,
                            //behaviors: [charts.SeriesLegend()],
                            animationDuration: Duration(seconds: 2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Tooltip(
                          message: message2,
                          child: charts.BarChart(
                            _seriesData2,
                            animate: true,
                            barGroupingType: charts.BarGroupingType.grouped,
                            //behaviors: [charts.SeriesLegend()],
                            animationDuration: Duration(seconds: 2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Tooltip(
                          message: message3,
                          child: charts.BarChart(
                            _seriesData3,
                            animate: true,
                            barGroupingType: charts.BarGroupingType.grouped,
                            //behaviors: [charts.SeriesLegend()],
                            animationDuration: Duration(seconds: 2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
