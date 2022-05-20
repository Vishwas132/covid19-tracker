import 'package:cached_network_image/cached_network_image.dart';
import 'package:covid_19_stats/objects/world_data.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final Map<String, Country> map;
  final String query;
  const ResultPage({Key? key, required this.map, required this.query})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Card(
          color: Colors.grey[100],
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 5),
                child: Column(
                  children: <Widget>[
                    CountryName(map: map, query: query),
                    Cases(map: map, query: query),
                    Deaths(map: map, query: query),
                    Recovered(map: map, query: query),
                    Active(map: map, query: query),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CountryName extends StatelessWidget {
  const CountryName({
    Key? key,
    required this.map,
    required this.query,
  }) : super(key: key);

  final Map<String, Country> map;
  final String query;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 10),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Text(
                    map[query]!.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: map[query]!.flag,
                    imageBuilder: (context, imageProvider) => CircleAvatar(
                      radius: 27.0,
                      backgroundColor: Colors.transparent,
                      backgroundImage: imageProvider,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ])),
    );
  }
}

class Cases extends StatelessWidget {
  const Cases({
    Key? key,
    required this.map,
    required this.query,
  }) : super(key: key);

  final Map<String, Country> map;
  final String query;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                "Cases",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              Text(
                map[query]!.cases.toString(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Deaths extends StatelessWidget {
  const Deaths({
    Key? key,
    required this.map,
    required this.query,
  }) : super(key: key);

  final Map<String, Country> map;
  final String query;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                "Deaths",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              Text(
                map[query]!.deaths.toString(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Recovered extends StatelessWidget {
  const Recovered({
    Key? key,
    required this.map,
    required this.query,
  }) : super(key: key);

  final Map<String, Country> map;
  final String query;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                "Recovered",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
              Text(
                map[query]!.recovered.toString(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Active extends StatelessWidget {
  const Active({
    Key? key,
    required this.map,
    required this.query,
  }) : super(key: key);

  final Map<String, Country> map;
  final String query;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                "Active",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurpleAccent),
              ),
              Text(
                map[query]!.active.toString(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
