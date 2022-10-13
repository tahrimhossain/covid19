import 'package:covid19/Models/Global.dart';

class GlobalViewState{
  GlobalViewState();
}

class LoadingGlobalViewState extends GlobalViewState{
  LoadingGlobalViewState():super();
}

class LoadedGlobalViewState extends GlobalViewState{
  Global globalData;
  LoadedGlobalViewState(this.globalData):super();
}

class ErrorLoadingGlobalViewState extends GlobalViewState{
  ErrorLoadingGlobalViewState():super();
}
