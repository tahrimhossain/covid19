import 'package:covid19/Models/Country.dart';
import 'package:covid19/Models/Global.dart';

class CovidData{
  late Global global;
  late List<Country> countries;

  CovidData({required this.global,required this.countries});

  CovidData.fromJson(Map<String, dynamic> json) {
    global = new Global.fromJson(json['Global']);
    if (json['Countries'] != null) {
      countries = <Country>[];
      json['Countries'].forEach((v) { countries.add(new Country.fromJson(v)); });
    }
  }

}