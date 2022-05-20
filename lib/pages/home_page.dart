import 'package:covid_19_stats/objects/country_search.dart';
import 'package:covid_19_stats/objects/data_loader.dart';
import 'package:covid_19_stats/objects/world_data.dart';
import 'package:covid_19_stats/pages/show_list.dart';
import 'package:flutter/material.dart';

class Worldwide extends StatefulWidget {
  final List<Country> value;
  final Map<String, dynamic> info;
  final List<String> countries;
  final Map<String, Country> map;
  const Worldwide(
      {Key? key,
      required this.value,
      required this.info,
      required this.countries,
      required this.map})
      : super(key: key);

  @override
  WorldwideState createState() => WorldwideState();
}

class WorldwideState extends State<Worldwide> {
  Routing r = Routing();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text(
            'COVID-19',
            style: TextStyle(color: Colors.white, fontSize: 35.0),
          ),
          actions: <Widget>[
            IconButton(
              iconSize: 30.0,
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CountrySearch(
                    countries: widget.countries,
                    map: widget.map,
                    value: widget.value,
                    info: widget.info,
                  ),
                );
              },
              color: Colors.white,
            )
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            return await Future.delayed(
                const Duration(seconds: 10), (() => r.route(context)));
          },
          child: ShowList(
            value: widget.value,
            info: widget.info,
            countries: widget.countries,
            map: widget.map,
          ),
        ),
      ),
    );
  }
}
