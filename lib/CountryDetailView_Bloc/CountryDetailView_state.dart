import 'package:covid19/Models/Country.dart';
import 'package:fl_chart/fl_chart.dart';

class CountryDetailViewState{
  CountryDetailViewState();
}


class LoadingCountryDetailViewState extends CountryDetailViewState{
  LoadingCountryDetailViewState():super();
}

class LoadedCountryDetailViewState extends CountryDetailViewState{
  late List<FlSpot> listOfConfirmedCasesSpots;
  late List<FlSpot> listOfDeathsSpots;
  late Country country;

  LoadedCountryDetailViewState(this.country,this.listOfConfirmedCasesSpots,this.listOfDeathsSpots):super();
}

class ErrorLoadingCountryDetailView extends CountryDetailViewState{
  ErrorLoadingCountryDetailView():super();
}