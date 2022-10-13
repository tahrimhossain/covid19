import 'package:covid19/CountryView_Bloc/CountryView_bloc.dart';
import 'package:flutter/material.dart';
import 'package:covid19/Views/CountryCard.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryView extends StatefulWidget {

  const CountryView({Key? key}): super(key: key);

  @override
  _CountryViewState createState() => _CountryViewState();
}

class _CountryViewState extends State<CountryView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<CountryViewBloc>(context)
          .add(LoadCountryViewEvent());
    });
  }
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<CountryViewBloc,CountryViewState>(
        builder: (context,state){

          if(state is LoadingCountryViewState){
            return Center(child: CircularProgressIndicator(),);
          }else if(state is LoadedCountryViewState){
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Expanded(
                      child: new ListView.separated(
                        padding: EdgeInsets.all(12),
                        itemCount: state.countries.countries!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return new CountryCard(state.countries.countries![index]);
                        },
                        separatorBuilder: (BuildContext context, int index) => SizedBox(
                          height: MediaQuery.of(context).size.height / 100,
                        ),
                      )),
                ]);
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
                            BlocProvider.of<CountryViewBloc>(context)
                                .add(LoadCountryViewEvent());
                          },
                          child: Text(
                            "Retry",
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          )),
                    ],
                  ),
                ));
          }
        }
    );
  }
}
