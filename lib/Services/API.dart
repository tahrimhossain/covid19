import 'package:covid19/Models/Global.dart';
import 'package:covid19/Models/GraphData.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Models/Countries.dart';
import '../Models/Country.dart';



class API{
  Future<Global> getGlobalData()async{
    http.Response response = await http.get(Uri.parse('https://cov-api-19.herokuapp.com/global'));
    if(response.statusCode == 200){
      return Global.fromJson(json.decode(response.body));
    }
    else{
      throw Exception("Error Fetching Data");
    }
  }
  Future<Countries> getCountries()async{

    http.Response response = await http.get(Uri.parse('https://cov-api-19.herokuapp.com/summary')).timeout(Duration(seconds: 7));
    if(response.statusCode == 200){
      return Countries.fromJson(json.decode(response.body));
    }
    else{
      throw Exception("Error Fetching Data");
    }

  }

  Future<Country> getCountry(String country)async{
    http.Response response = await http.get(Uri.parse('https://cov-api-19.herokuapp.com/country/'+country)).timeout(Duration(seconds: 7));
    if(response.statusCode == 200){
      return Country.fromJson(json.decode(response.body));
    }
    else{
      throw Exception("Error Fetching Data");
    }
  }

  Future<List<FlSpot>> fetchConfirmedGraphData(String countryName)async
  {

    http.Response response = await http.get(Uri.parse('https://cov-api-19.herokuapp.com/all/confirmed/'+countryName)).timeout(Duration(seconds: 7));
    if(response.statusCode == 200){

      List<FlSpot> listOfSpots = <FlSpot>[];

      json.decode(response.body).forEach((element){
        GraphData data = GraphData.fromJson(element);
        listOfSpots.add(FlSpot(data.date.millisecondsSinceEpoch.toDouble(), data.count.toDouble()));
      });

      return listOfSpots;

    }else{
      throw Exception("Error Fetching Data");
    }

  }


  Future<List<FlSpot>> fetchConfirmedDeathData(String countryName)async
  {

    http.Response response = await http.get(Uri.parse('https://cov-api-19.herokuapp.com/all/death/'+countryName)).timeout(Duration(seconds: 7));
    if(response.statusCode == 200){

      List<FlSpot> listOfSpots = <FlSpot>[];

      json.decode(response.body).forEach((element){
        GraphData data = GraphData.fromJson(element);
        listOfSpots.add(FlSpot(data.date.millisecondsSinceEpoch.toDouble(), data.count.toDouble()));
      });

      return listOfSpots;

    }else{
      throw Exception("Error Fetching Data");
    }

  }



}