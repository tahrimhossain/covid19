class CountryDetailViewEvent {
  CountryDetailViewEvent();
}

class LoadCountryDetailView extends CountryDetailViewEvent{
  String country;
  LoadCountryDetailView({required this.country}):super();

}