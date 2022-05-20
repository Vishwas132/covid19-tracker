class Country {
  String name;
  final String cases;
  final String deaths;
  final String recovered;
  final String active;
  final String flag;

  Country({
    required this.name,
    required this.cases,
    required this.deaths,
    required this.recovered,
    required this.active,
    required this.flag,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['country'].toString(),
      cases: json['cases'].toString(),
      deaths: json['deaths'].toString(),
      recovered: json['recovered'].toString(),
      active: json['active'].toString(),
      flag: json['countryInfo']['flag'].toString(),
    );
  }
}
