import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class DeathsGraph extends StatefulWidget{
  final List<FlSpot> listOfDeathsSpots;
  DeathsGraph(this.listOfDeathsSpots);

  @override
  _DeathsGraphState createState()=> _DeathsGraphState();
}

class _DeathsGraphState extends State<DeathsGraph>{

  List<Color> gradientColorsForDeaths = [
    const Color(0xffA71D31),
    const Color(0xffBF3A30),
  ];

  @override
  Widget build(BuildContext context) {

    return Container(
      height: MediaQuery.of(context).size.height/2,
      width: MediaQuery.of(context).size.width/1.2,
      child: LineChart(
          LineChartData(
              gridData: FlGridData(show: false),
              lineBarsData: [
                LineChartBarData(
                  spots: widget.listOfDeathsSpots,
                  isCurved: true,
                  barWidth: 2,
                  preventCurveOverShooting: true,
                  colors: gradientColorsForDeaths,
                  isStrokeCapRound: true,
                  dotData: FlDotData(
                    show: false,
                  ),
                  belowBarData: BarAreaData(
                    show: true,
                    colors: gradientColorsForDeaths.map((color) => color.withOpacity(0.3)).toList(),
                  ),
                )
              ],
              titlesData: FlTitlesData(
                bottomTitles: SideTitles(showTitles: false),
                leftTitles: SideTitles(showTitles: false),
              ),
              borderData: FlBorderData(show: false ),
              lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                      tooltipBgColor: Colors.red,
                      getTooltipItems: (touchedSpots){
                        return touchedSpots.map((touchedSpot){
                          String cases = touchedSpot.y.toString();
                          DateTime date = new DateTime.fromMillisecondsSinceEpoch(touchedSpot.x.toInt());

                          return LineTooltipItem("Deaths: "+cases+"\non "+DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY).format(date).toString(),
                              TextStyle(color:Colors.white,fontWeight: FontWeight.bold) );
                        } ).toList();
                      }
                  )
              )

          )
      ),
    );

  }

}