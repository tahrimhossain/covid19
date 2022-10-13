import 'package:covid19/GlobalView_Bloc/GlobalView_bloc.dart';
import 'package:covid19/GlobalView_Bloc/GlobalView_event.dart';
import 'package:covid19/GlobalView_Bloc/GlobalView_state.dart';
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
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<GlobalViewBloc>(context)
          .add(LoadGlobalViewEvent());
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalViewBloc,GlobalViewState>(

      builder: (context,state){
        if(state is LoadingGlobalViewState){
          return Center(child: CircularProgressIndicator(),);
        }else if(state is LoadedGlobalViewState){
          return ListView(
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
                        child: Text(state.globalData.totalConfirmed.toString(),style:TextStyle(fontWeight: FontWeight.w500,fontSize:30,color: Colors.white),),
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
                              child: Text(state.globalData.totalDeaths.toString(),style:TextStyle(fontWeight: FontWeight.w500,fontSize:20,color: Colors.white),),
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
                              child: Text(state.globalData.totalRecovered.toString(),style:TextStyle(fontWeight: FontWeight.w500,fontSize:20,color: Colors.white),),
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
                        child: Text(state.globalData.newConfirmed.toString(),style:TextStyle(fontWeight: FontWeight.w500,fontSize:30,color: Colors.white),),
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
                              child: Text(state.globalData.newDeaths.toString(),style:TextStyle(fontWeight: FontWeight.w500,fontSize:20,color: Colors.white),),
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
                              child: Text(state.globalData.newRecovered.toString(),style:TextStyle(fontWeight: FontWeight.w500,fontSize:20,color: Colors.white),),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        }else{
          return Center(
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
              ));
        }
      },

    );
  }
}