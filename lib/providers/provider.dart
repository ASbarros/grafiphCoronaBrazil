import 'dart:convert';

import 'package:http/http.dart' as http;

class Provider {
  static Future<Object> getCountry({String country}) async {
    var response = await http.get(
      "https://corona.lmao.ninja/countries/$country",
    );
    return json.decode(response.body);
  }
  static Future<Object> getAll() async {
    var response = await http.get(
      "https://corona.lmao.ninja/all",
    );

    return json.decode(response.body);
  }
}
