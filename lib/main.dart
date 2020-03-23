import 'package:covid19/pages/load.page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gráficos COVID-19',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoadPage(),
    );
  }
}
