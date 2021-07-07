class Country {
  late String iD;
  late String country;
  late  String countryCode;
  late int newConfirmed;
  late int totalConfirmed;
  late int newDeaths;
  late int totalDeaths;
  late int newRecovered;
  late int totalRecovered;



  Country({required this.iD,required this.country,required this.countryCode,required this.newConfirmed,required this.totalConfirmed,required this.newDeaths,required this.totalDeaths,required this.newRecovered,required this.totalRecovered});

  Country.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    country = json['Country'];
    countryCode = json['CountryCode'];
    newConfirmed = json['NewConfirmed'];
    totalConfirmed = json['TotalConfirmed'];
    newDeaths = json['NewDeaths'];
    totalDeaths = json['TotalDeaths'];
    newRecovered = json['NewRecovered'];
    totalRecovered = json['TotalRecovered'];

  }


}