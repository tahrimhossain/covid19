import 'package:covid19/Models/CovidData.dart';
import 'package:covid19/Models/GraphData.dart';
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

  Future fetchConfirmedGraphData(String countryName)async
  {

    try{
      http.Response response = await http.get(Uri.parse("https://api.covid19api.com/total/dayone/country/"+countryName+"/status/confirmed"));

      if(response.statusCode == 200){

        List<GraphData> listOfData = <GraphData>[];
        json.decode(response.body).forEach((element){
          listOfData.add(GraphData.fromJson(element));
        });

      }
    }catch(e){

    }




  }



}