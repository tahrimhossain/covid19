import 'package:covid19/Models/Country.dart';

class Countries {
  List<Country>? countries;

  Countries({this.countries});

  Countries.fromJson(Map<String, dynamic> json) {
    if (json['Countries'] != null) {
      countries = <Country>[];
      json['Countries'].forEach((v) {
        countries!.add(new Country.fromJson(v));
      });
    }
  }

}


