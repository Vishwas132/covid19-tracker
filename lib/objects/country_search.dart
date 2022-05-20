import 'package:cached_network_image/cached_network_image.dart';
import 'package:covid_19_stats/objects/world_data.dart';
import 'package:covid_19_stats/pages/home_page.dart';
import 'package:covid_19_stats/pages/result_page.dart';
import 'package:flutter/material.dart';

class CountrySearch extends SearchDelegate<Worldwide> {
  List<String> countries;
  Map<String, Country> map;
  List<Country> value;
  Map<String, dynamic> info;

  late List<String> suggestion;

  CountrySearch(
      {required this.countries,
      required this.map,
      required this.value,
      required this.info});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          if (query.isEmpty) {
            close(
                context,
                Worldwide(
                    value: value, info: info, countries: countries, map: map));
          } else {
            showSuggestions(context);
            query = '';
          }
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(
            context,
            Worldwide(
                value: value, info: info, countries: countries, map: map));
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    Widget searchResult = suggestion.isEmpty || query.isEmpty
        ? const Center(
            child: Text('No Suggestion'),
          )
        : buildSuggestions(context);
    return searchResult;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    suggestion = countries
        .where((String str) => compareTextToCountry(query: query, str: str))
        .toList();

    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  shape: BoxShape.rectangle,
                ),
                child: suggestionList(index, context),
              );
            },
            itemCount: suggestion.length,
          ),
        ),
      ],
    );
  }

  // Compare typed text to country name to show suggestion
  bool compareTextToCountry({String? query, String? str}) =>
      str!.toLowerCase().contains(query!);

  // Build list of suggestion
  ListTile suggestionList(int index, BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
        child: CachedNetworkImage(
          imageUrl: map[suggestion[index]]!.flag,
          imageBuilder: (context, imageProvider) => CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: imageProvider,
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
      title: Text(
        suggestion[index],
        style: const TextStyle(fontSize: 20.0),
      ),
      onTap: () {
        query = suggestion[index];
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(
              map: map,
              query: query,
            ),
          ),
        );
      },
    );
  }
}
