class GraphData{
  late int count;
  late String date;

  GraphData.fromJson(Map<String, dynamic> json) {
    count = json['Cases'];
    date = json['Date'];
  }

}