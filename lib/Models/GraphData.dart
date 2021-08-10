class GraphData{
  late int count;
  late DateTime date;

  GraphData.fromJson(Map<String, dynamic> json) {
    count = json['Cases'];
    date = DateTime.parse(json['Date']);
  }

}