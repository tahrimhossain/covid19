import 'package:covid19/Models/Country.dart';

class CountryDetailViewEvent {
  CountryDetailViewEvent();
}

class LoadCountryDetailView extends CountryDetailViewEvent{
  late Country country;
  LoadCountryDetailView(this.country):super();

}