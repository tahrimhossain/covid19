import 'dart:async';
import 'package:bloc/bloc.dart';
import '../Models/Countries.dart';
import '../Services/API.dart';

part 'CountryView_event.dart';
part 'CountryView_state.dart';

class CountryViewBloc extends Bloc<CountryViewEvent, CountryViewState> {
  final API _api;
  CountryViewBloc(API api):_api = api,super(LoadingCountryViewState());

  @override
  Stream<CountryViewState> mapEventToState(CountryViewEvent event)async* {
    if(event is LoadCountryViewEvent){
      if(state is! LoadingCountryViewState){
        yield LoadingCountryViewState();
      }
      try{
        Countries countries = await _api.getCountries();
        yield LoadedCountryViewState(countries);
      }catch(e){
        yield ErrorLoadingCountryViewState();
      }
    }else if(event is TransitionToOtherPageFromCountryView){
      yield LoadingCountryViewState();
    }
  }

}
