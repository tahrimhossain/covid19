import 'package:covid19/CountryDetailView_Bloc/CountryDetailView_bloc.dart';
import 'package:covid19/CountryDetailView_Bloc/CountryDetailView_event.dart';
import 'package:covid19/CountryDetailView_Bloc/CountryDetailView_state.dart';
import 'package:covid19/Views/ConfirmedGraph.dart';
import 'package:covid19/Views/DeathsGraph.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class CountryDetailView extends StatefulWidget{
  final String country;
  CountryDetailView(this.country);
  @override
  _CountryDetailViewState createState() => _CountryDetailViewState();
}

class _CountryDetailViewState extends State<CountryDetailView>{
  @override
  void initState() {
    BlocProvider.of<CountryDetailViewBloc>(context)
        .add(LoadCountryDetailView(country: widget.country));
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<CountryDetailViewBloc,CountryDetailViewState>(
      
        builder: (context,state){
          if(state is LoadingCountryDetailViewState){
            return Scaffold(
              body: Center(child: CircularProgressIndicator(),),
            );
          }else if(state is LoadedCountryDetailViewState){
            return Scaffold(
              body: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    snap: false,
                    floating: false,
                    automaticallyImplyLeading: true,
                    systemOverlayStyle: SystemUiOverlayStyle.dark,
                    iconTheme: IconThemeData(color: Colors.black),
                    centerTitle: true,
                    title: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(widget.country,style:TextStyle(fontWeight: FontWeight.bold,fontSize:22,color: Colors.black),),
                    ),
                    backgroundColor: Colors.white,
                    expandedHeight: (100/844)*MediaQuery.of(context).size.height,
                    flexibleSpace: FlexibleSpaceBar(
                        background: Padding(
                          padding: EdgeInsets.only(bottom:12,top:4),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Container(
                                height:35,
                                width:70,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(state.country.flag,),
                                    fit: BoxFit.cover,
                                  ),
                                  border: Border.all(width:0.2),
                                ),
                              ),
                            ],
                          ),
                        )
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.only(top:30,bottom:30),
                    sliver: SliverList(
                        delegate: SliverChildListDelegate([
                          SizedBox(height: 30,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: ConfirmedGraph(state.listOfConfirmedCasesSpots),
                          ),
                          SizedBox(height: 10,),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text("Cases",style:TextStyle(fontWeight: FontWeight.w200,fontSize:12,color: Colors.black),),
                          ),
                          SizedBox(height: 50,),
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width/2,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                                  color: Colors.blue,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text("Total Confirmed",style:TextStyle(fontWeight: FontWeight.bold,fontSize:20,color: Colors.white),),
                                        ),
                                        SizedBox(height: 20,),
                                        FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(state.country.totalConfirmed.toString(),style:TextStyle(fontWeight: FontWeight.w500,fontSize:20,color: Colors.white),),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
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
                                          child: Text(state.country.totalDeaths.toString(),style:TextStyle(fontWeight: FontWeight.w500,fontSize:20,color: Colors.white),),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              SizedBox(
                                width:MediaQuery.of(context).size.width/2,
                                child:  Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                                  color: Colors.blue,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text("New Confirmed",style:TextStyle(fontWeight: FontWeight.bold,fontSize:20,color: Colors.white),),
                                        ),
                                        SizedBox(height: 20,),
                                        FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(state.country.newConfirmed.toString(),style:TextStyle(fontWeight: FontWeight.w500,fontSize:20,color: Colors.white),),
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
                                          child: Text(state.country.newDeaths.toString(),style:TextStyle(fontWeight: FontWeight.w500,fontSize:20,color: Colors.white),),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: DeathsGraph(state.listOfDeathsSpots),
                          ),
                          SizedBox(height: 10,),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text("Deaths",style:TextStyle(fontWeight: FontWeight.w200,fontSize:12,color: Colors.black),),
                          ),
                          SizedBox(height: 10,),
                        ])
                    ),
                  )
                ],
              ),
            );
          }else{
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                iconTheme: new IconThemeData(color: Colors.black),
                systemOverlayStyle: SystemUiOverlayStyle.light,
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
                              BlocProvider.of<CountryDetailViewBloc>(context)
                                  .add(LoadCountryDetailView(country:widget.country));
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