part of 'CountryView_bloc.dart';

class CountryViewState {
  CountryViewState();
}

class LoadingCountryViewState extends CountryViewState{
  LoadingCountryViewState():super();
}

class LoadedCountryViewState extends CountryViewState{
  Countries countries;
  LoadedCountryViewState(this.countries):super();
}

class ErrorLoadingCountryViewState extends CountryViewState{
  ErrorLoadingCountryViewState():super();
}

