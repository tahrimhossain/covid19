import 'package:covid19/Models/CovidData.dart';

class GlobalViewState{
  GlobalViewState();
}

class LoadingGlobalViewState extends GlobalViewState{
  LoadingGlobalViewState():super();
}

class LoadedGlobalViewState extends GlobalViewState{
  CovidData covidData;
  LoadedGlobalViewState(this.covidData):super();
}

class ErrorLoadingGlobalViewState extends GlobalViewState{
  ErrorLoadingGlobalViewState():super();
}

class ErrorRefreshingGlobalViewState extends GlobalViewState{
  CovidData covidData;
  ErrorRefreshingGlobalViewState(this.covidData):super();
}