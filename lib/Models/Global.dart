class Global{
  late int newConfirmed;
  late int totalConfirmed;
  late int newDeaths;
  late int totalDeaths;
  late int newRecovered;
  late int totalRecovered;

  Global({required this.newConfirmed,required this.totalConfirmed,required this.newDeaths,required this.totalDeaths,required this.newRecovered,required this.totalRecovered});

  Global.fromJson(Map<String, dynamic> json) {
    newConfirmed = json['NewConfirmed'];
    totalConfirmed = json['TotalConfirmed'];
    newDeaths = json['NewDeaths'];
    totalDeaths = json['TotalDeaths'];
    newRecovered = json['NewRecovered'];
    totalRecovered = json['TotalRecovered'];
  }


}