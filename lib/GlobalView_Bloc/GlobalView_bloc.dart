import 'package:covid19/GlobalView_Bloc/GlobalView_event.dart';
import 'package:covid19/GlobalView_Bloc/GlobalView_state.dart';
import 'package:covid19/Models/Global.dart';
import 'package:covid19/Services/API.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GlobalViewBloc extends Bloc<GlobalViewEvent,GlobalViewState>{
  final API _api;
  GlobalViewBloc(API api):_api = api,super(LoadingGlobalViewState());

  @override
  Stream<GlobalViewState> mapEventToState(GlobalViewEvent event)async* {
    if(event is LoadGlobalViewEvent){
        if(state is! LoadingGlobalViewState){
          yield LoadingGlobalViewState();
        }
        try{
          Global globalData = await _api.getGlobalData();
          yield LoadedGlobalViewState(globalData);
        }catch(e){
          yield ErrorLoadingGlobalViewState();
        }
    }else if(event is TransitionToOtherPageFromGlobalView){
      yield LoadingGlobalViewState();
    }
  }

}