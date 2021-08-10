import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class ConfirmedGraph extends StatefulWidget{
  final List<FlSpot> listOfConfirmedCasesSpots;
  ConfirmedGraph(this.listOfConfirmedCasesSpots);

  @override
  _ConfirmedGraphState createState()=> _ConfirmedGraphState();
}

class _ConfirmedGraphState extends State<ConfirmedGraph>{

  List<Color> gradientColorsForConfirmed = [
    const Color(0xff4481eb),
    const Color(0xff495aff),
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
                  spots: widget.listOfConfirmedCasesSpots,
                  isCurved: true,
                  barWidth: 2,
                  preventCurveOverShooting: true,
                  colors: gradientColorsForConfirmed,
                  isStrokeCapRound: true,
                  dotData: FlDotData(
                    show: false,
                  ),
                  belowBarData: BarAreaData(
                    show: true,
                    colors: gradientColorsForConfirmed.map((color) => color.withOpacity(0.3)).toList(),
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
                      tooltipBgColor: Colors.blue,
                      getTooltipItems: (touchedSpots){
                        return touchedSpots.map((touchedSpot){
                          String cases = touchedSpot.y.toString();
                          DateTime date = new DateTime.fromMillisecondsSinceEpoch(touchedSpot.x.toInt());

                          return LineTooltipItem("Cases: "+cases+"\non "+DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY).format(date).toString(),
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