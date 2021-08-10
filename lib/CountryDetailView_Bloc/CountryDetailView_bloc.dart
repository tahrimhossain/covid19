import 'package:covid19/Services/API.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'CountryDetailView_event.dart';
import 'CountryDetailView_state.dart';

class CountryDetailViewBloc extends Bloc<CountryDetailViewEvent,CountryDetailViewState>{
  final API _api;
  CountryDetailViewBloc(API api):_api = api,super(LoadingCountryDetailViewState());

  @override
  Stream<CountryDetailViewState> mapEventToState(CountryDetailViewEvent event)async* {
    if(event is LoadCountryDetailView){
      if(state is! LoadingCountryDetailViewState){
        yield LoadingCountryDetailViewState();
      }
      try{
        List<FlSpot> listOfConfirmedCasesSpots = await _api.fetchConfirmedGraphData(event.country.country);
        List<FlSpot> listOfDeathsSpots = await _api.fetchConfirmedDeathData(event.country.country);
        yield LoadedCountryDetailViewState(event.country, listOfConfirmedCasesSpots, listOfDeathsSpots);
      }catch(e){
        yield ErrorLoadingCountryDetailView();
      }
    }
  }
}