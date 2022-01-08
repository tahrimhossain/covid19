class Country {

  late String country;
  late String flag;
  late int newConfirmed;
  late int totalConfirmed;
  late int newDeaths;
  late int totalDeaths;
  late int newRecovered;
  late int totalRecovered;



  Country({required this.country,required this.flag,required this.newConfirmed,required this.totalConfirmed,required this.newDeaths,required this.totalDeaths,required this.newRecovered,required this.totalRecovered});

  Country.fromJson(Map<String, dynamic> json) {
    country = json['Country'];
    flag = json['Flag'];
    newConfirmed = json['NewConfirmed'];
    totalConfirmed = json['TotalConfirmed'];
    newDeaths = json['NewDeaths'];
    totalDeaths = json['TotalDeaths'];
    newRecovered = json['NewRecovered'];
    totalRecovered = json['TotalRecovered'];

  }


}