import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:covid_19_stats/objects/world_data.dart';
// import 'package:covid_19_stats/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Routing {
  final List<String> _countries = [];
  final HashMap<String, Country> _map = HashMap();
  Map<String, dynamic> _info = {};
  List<Country> _value = [];

  Future<List<Country>> fetchCountry(http.Client client) async {
    final http.Response response = await client.get(
        Uri.parse("https://disease.sh/v3/covid-19/countries/?sort=deaths"));
    final List responseJson = jsonDecode(response.body);
    return responseJson.map<Country>((json) => Country.fromJson(json)).toList();
  }

  Future<Map<String, dynamic>> fetchall(http.Client client) async {
    http.Response response =
        await client.get(Uri.parse('https://disease.sh/v3/covid-19/all'));
    return jsonDecode(response.body);
  }

  FutureOr<Map<dynamic, dynamic>> route(BuildContext context) async {
    List<Country> result = await fetchCountry(http.Client());
    for (var i = 0; i < result.length; i++) {
      List l = result[i].name.toString().split(",");
      result[i].name = l[0];
      _countries.add(result[i].name.toString());
      _map[result[i].name.toString()] = result[i];
    }
    _value = result;

    _info = await fetchall(http.Client());

    Map<dynamic, dynamic> obj = {
      "value": _value,
      "info": _info,
      "countries": _countries,
      "map": _map,
    };

    return obj;
  }
}

//   Future<dynamic> buildHome(context) {
//     return Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//         builder: (context) => Worldwide(
//           value: _value,
//           info: _info,
//           countries: _countries,
//           map: _map,
//         ),
//       ),
//     );
//   }
// }