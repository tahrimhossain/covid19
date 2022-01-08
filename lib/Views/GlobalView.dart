import 'package:covid19/GlobalView_Bloc/GlobalView_bloc.dart';
import 'package:covid19/GlobalView_Bloc/GlobalView_event.dart';
import 'package:covid19/GlobalView_Bloc/GlobalView_state.dart';
import 'package:covid19/Views/CountryView.dart';
import 'package:covid19/Views/SymptomsAndPreventions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GlobalView extends StatefulWidget{
  @override
  _GlobalViewState createState()=> _GlobalViewState();
}

class _GlobalViewState extends State<GlobalView>{
  @override
  void initState() {
    BlocProvider.of<GlobalViewBloc>(context)
        .add(LoadGlobalViewEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalViewBloc,GlobalViewState>(
      listener: (context,state){
        if(state is ErrorRefreshingGlobalViewState){

        }
      },

      builder: (context,state){
        if(state is LoadingGlobalViewState){
          return Scaffold(
            body: Center(child: CircularProgressIndicator(),),
          );
        }else if(state is LoadedGlobalViewState){
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text("Global",style:TextStyle(fontWeight: FontWeight.bold,fontSize:50,color: Colors.black),),
              ),
              elevation: 0,
              iconTheme: new IconThemeData(color: Colors.black),
              systemOverlayStyle: SystemUiOverlayStyle.dark,
            ),
            body:RefreshIndicator(
                child: ListView(
                  padding: EdgeInsets.only(top:30,bottom:30),
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0))),
                      color: Colors.blue,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text("Total Infected",style:TextStyle(fontWeight: FontWeight.bold,fontSize:30,color: Colors.white),),
                            ),
                            SizedBox(height: 20,),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(state.covidData.global.totalConfirmed.toString(),style:TextStyle(fontWeight: FontWeight.w500,fontSize:30,color: Colors.white),),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width/2,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15.0))),
                            color: Colors.red,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text("Total Deaths",style:TextStyle(fontWeight: FontWeight.bold,fontSize:20,color: Colors.white),),
                                  ),
                                  SizedBox(height: 20,),
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(state.covidData.global.totalDeaths.toString(),style:TextStyle(fontWeight: FontWeight.w500,fontSize:20,color: Colors.white),),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width:MediaQuery.of(context).size.width/2,
                          child:  Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15.0))),
                            color: Colors.green,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text("Total Recovered",style:TextStyle(fontWeight: FontWeight.bold,fontSize:20,color: Colors.white),),
                                  ),
                                  SizedBox(height: 20,),
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(state.covidData.global.totalRecovered.toString(),style:TextStyle(fontWeight: FontWeight.w500,fontSize:20,color: Colors.white),),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: (40/812)*MediaQuery.of(context).size.height,),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0))),
                      color: Colors.blue,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text("New Infected",style:TextStyle(fontWeight: FontWeight.bold,fontSize:30,color: Colors.white),),
                            ),
                            SizedBox(height: 20,),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(state.covidData.global.newConfirmed.toString(),style:TextStyle(fontWeight: FontWeight.w500,fontSize:30,color: Colors.white),),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width/2,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15.0))),
                            color: Colors.red,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text("New Deaths",style:TextStyle(fontWeight: FontWeight.bold,fontSize:20,color: Colors.white),),
                                  ),
                                  SizedBox(height: 20,),
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(state.covidData.global.newDeaths.toString(),style:TextStyle(fontWeight: FontWeight.w500,fontSize:20,color: Colors.white),),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width:MediaQuery.of(context).size.width/2,
                          child:  Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15.0))),
                            color: Colors.green,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text("New Recovered",style:TextStyle(fontWeight: FontWeight.bold,fontSize:20,color: Colors.white),),
                                  ),
                                  SizedBox(height: 20,),
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(state.covidData.global.newRecovered.toString(),style:TextStyle(fontWeight: FontWeight.w500,fontSize:20,color: Colors.white),),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                onRefresh:()async{
                  BlocProvider.of<GlobalViewBloc>(context)
                      .add(RefreshGlobalViewEvent(state.covidData));
                }
            ),
            drawer: Drawer(
              child: ListView(
                children: [
                  ListTile(
                    title: Text("Search by Country"),
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CountryView(state.covidData)));
                    },
                  ),
                  ListTile(
                    title: Text("Symptoms & Preventions"),
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SymptomsAndPreventions()));
                    },
                  ),
                ],
              ),
            ),
          );
        }else if(state is ErrorRefreshingGlobalViewState){
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text("Global",style:TextStyle(fontWeight: FontWeight.bold,fontSize:50,color: Colors.black),),
              ),
              elevation: 0,
              iconTheme: new IconThemeData(color: Colors.black),
              systemOverlayStyle: SystemUiOverlayStyle.dark,
            ),
            body:RefreshIndicator(
                child: ListView(
                  padding: EdgeInsets.only(top:30,bottom:30),
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0))),
                      color: Colors.blue,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text("Total Infected",style:TextStyle(fontWeight: FontWeight.bold,fontSize:30,color: Colors.white),),
                            ),
                            SizedBox(height: 20,),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(state.covidData.global.totalConfirmed.toString(),style:TextStyle(fontWeight: FontWeight.w500,fontSize:30,color: Colors.white),),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width/2,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15.0))),
                            color: Colors.red,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text("Total Deaths",style:TextStyle(fontWeight: FontWeight.bold,fontSize:20,color: Colors.white),),
                                  ),
                                  SizedBox(height: 20,),
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(state.covidData.global.totalDeaths.toString(),style:TextStyle(fontWeight: FontWeight.w500,fontSize:20,color: Colors.white),),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width:MediaQuery.of(context).size.width/2,
                          child:  Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15.0))),
                            color: Colors.green,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text("Total Recovered",style:TextStyle(fontWeight: FontWeight.bold,fontSize:20,color: Colors.white),),
                                  ),
                                  SizedBox(height: 20,),
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(state.covidData.global.totalRecovered.toString(),style:TextStyle(fontWeight: FontWeight.w500,fontSize:20,color: Colors.white),),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: (40/812)*MediaQuery.of(context).size.height,),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0))),
                      color: Colors.blue,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text("New Infected",style:TextStyle(fontWeight: FontWeight.bold,fontSize:30,color: Colors.white),),
                            ),
                            SizedBox(height: 20,),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(state.covidData.global.newConfirmed.toString(),style:TextStyle(fontWeight: FontWeight.w500,fontSize:30,color: Colors.white),),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width/2,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15.0))),
                            color: Colors.red,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text("New Deaths",style:TextStyle(fontWeight: FontWeight.bold,fontSize:20,color: Colors.white),),
                                  ),
                                  SizedBox(height: 20,),
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(state.covidData.global.newDeaths.toString(),style:TextStyle(fontWeight: FontWeight.w500,fontSize:20,color: Colors.white),),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width:MediaQuery.of(context).size.width/2,
                          child:  Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15.0))),
                            color: Colors.green,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text("New Recovered",style:TextStyle(fontWeight: FontWeight.bold,fontSize:20,color: Colors.white),),
                                  ),
                                  SizedBox(height: 20,),
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(state.covidData.global.newRecovered.toString(),style:TextStyle(fontWeight: FontWeight.w500,fontSize:20,color: Colors.white),),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                onRefresh:()async{
                  BlocProvider.of<GlobalViewBloc>(context)
                      .add(RefreshGlobalViewEvent(state.covidData));
                }
            ),
            drawer: Drawer(
              child: ListView(
                children: [
                  ListTile(
                    title: Text("Search by Country"),
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CountryView(state.covidData)));
                    },
                  ),
                  ListTile(
                    title: Text("Symptoms & Preventions"),
                  ),
                ],
              ),
            ),
          );
        }else{
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: new IconThemeData(color: Colors.black),
              systemOverlayStyle: SystemUiOverlayStyle.dark,
            ),
            body: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: (10/375)*MediaQuery.of(context).size.width),
                  child: Column(
                    children: [
                      SizedBox(
                        height: (30/812)*MediaQuery.of(context).size.height,
                      ),
                      SizedBox(
                        height: (200/812)*MediaQuery.of(context).size.height,
                        child: new Image.asset(
                          "images/error.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: (70/812)*MediaQuery.of(context).size.height,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "Ooops!",
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 38),
                        ),
                      ),
                      SizedBox(
                        height: (50/812)*MediaQuery.of(context).size.height,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "There was an error!",
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "Make sure you're connected to the internet",
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w300,
                              fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        height: (130/812)*MediaQuery.of(context).size.height,
                      ),
                      TextButton(
                          onPressed: () {
                            BlocProvider.of<GlobalViewBloc>(context)
                                .add(LoadGlobalViewEvent());
                          },
                          child: Text(
                            "Retry",
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          )),
                    ],
                  ),
                )),
          );
        }
      },

    );
  }
}