import 'package:covid19/Models/CovidData.dart';
import 'package:covid19/Models/GraphData.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class API{

  Future<CovidData> getCovidData()async{
      try{
        http.Response response = await http.get(Uri.parse('https://api.covid19api.com/summary'));
        if(response.statusCode == 200){
          return CovidData.fromJson(json.decode(response.body));
        }
        else{
          throw Exception();
        }
      }catch(e){
        throw Exception("Error fetching Covid Data");
      }
  }

  Future<List<FlSpot>> fetchConfirmedGraphData(String countryName)async
  {

    try{
      http.Response response = await http.get(Uri.parse("https://api.covid19api.com/total/dayone/country/"+countryName+"/status/confirmed"));

      if(response.statusCode == 200){

        List<FlSpot> listOfSpots = <FlSpot>[];

        int count = 0;

        json.decode(response.body).forEach((element){
          GraphData data = GraphData.fromJson(element);
          int temp = data.count;
          data.count -= count;
          if(data.count < 0){
            data.count = 0;
          }
          count = temp;
          listOfSpots.add(FlSpot(data.date.millisecondsSinceEpoch.toDouble(), data.count.toDouble()));
        });
        
        return listOfSpots;

      }else{
        throw Exception();
      }
    }catch(e){
        throw Exception("Error Fetching Data");
    }

  }


  Future<List<FlSpot>> fetchConfirmedDeathData(String countryName)async
  {

    try{
      http.Response response = await http.get(Uri.parse("https://api.covid19api.com/total/dayone/country/"+countryName+"/status/deaths"));

      if(response.statusCode == 200){

        List<FlSpot> listOfSpots = <FlSpot>[];

        int count = 0;

        json.decode(response.body).forEach((element){
          GraphData data = GraphData.fromJson(element);
          int temp = data.count;
          data.count -= count;
          if(data.count < 0){
            data.count = 0;
          }
          count = temp;
          listOfSpots.add(FlSpot(data.date.millisecondsSinceEpoch.toDouble(), data.count.toDouble()));
        });

        return listOfSpots;

      }else{
        throw Exception();
      }
    }catch(e){
      throw Exception("Error Fetching Data");
    }

  }



}