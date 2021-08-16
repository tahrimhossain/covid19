import 'dart:async';
import 'package:covid19/Models/CovidData.dart';
import 'package:covid19/Views/SearchPage.dart';
import 'package:flutter/material.dart';
import 'package:covid19/Views/CountryCard.dart';

class CountryView extends StatefulWidget {
  final CovidData covidData;

  CountryView(this.covidData);

  @override
  _CountryViewState createState() => _CountryViewState();
}

class _CountryViewState extends State<CountryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text("Countries",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25)),
        ),
        iconTheme: new IconThemeData(color: Colors.black),
        brightness: Brightness.light,
        actions: [
          GestureDetector(
            child: Icon(Icons.search),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage(widget.covidData)));
            },
          ),
        ],
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Expanded(
                child: new ListView.separated(
              padding: EdgeInsets.all(12),
              itemCount: widget.covidData.countries.length,
              itemBuilder: (BuildContext context, int index) {
                return new CountryCard(widget.covidData.countries[index]);
              },
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                height: MediaQuery.of(context).size.height / 100,
              ),
            )),
          ]),
    );
  }
}
