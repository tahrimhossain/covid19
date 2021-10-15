import 'package:covid19/Models/CovidData.dart';
import 'package:covid19/Models/GraphData.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class API{

  Future<CovidData> getCovidData()async{

    http.Response response = await http.get(Uri.parse('https://cov-api-19.herokuapp.com/summary'));
    if(response.statusCode == 200){
      return CovidData.fromJson(json.decode(response.body));
    }
    else{
      throw Exception("Error Fetching Data");
    }

  }

  Future<List<FlSpot>> fetchConfirmedGraphData(String countryName)async
  {

    http.Response response = await http.get(Uri.parse('https://cov-api-19.herokuapp.com/all/confirmed/'+countryName));
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

    http.Response response = await http.get(Uri.parse('https://cov-api-19.herokuapp.com/all/death/'+countryName));
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