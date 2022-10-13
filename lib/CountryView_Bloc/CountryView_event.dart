part of 'CountryView_bloc.dart';

class CountryViewEvent {}

class LoadCountryViewEvent extends CountryViewEvent{
  LoadCountryViewEvent():super();
}

class TransitionToOtherPageFromCountryView extends CountryViewEvent{
  TransitionToOtherPageFromCountryView():super();
}
