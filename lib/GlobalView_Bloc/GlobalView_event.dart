import 'package:covid19/Models/CovidData.dart';

class GlobalViewEvent
{
  GlobalViewEvent();
}

class LoadGlobalViewEvent extends GlobalViewEvent{
  LoadGlobalViewEvent():super();
}

class RefreshGlobalViewEvent extends GlobalViewEvent{
  CovidData covidData;
  RefreshGlobalViewEvent(this.covidData):super();
}