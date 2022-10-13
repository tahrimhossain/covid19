import 'package:covid19/Models/Country.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';



class CountryCard extends StatefulWidget {

  final Country country;
  CountryCard(this.country);

  @override
  _CountryCardState createState() => _CountryCardState();


}




class _CountryCardState extends State<CountryCard> with SingleTickerProviderStateMixin
{

  late TabController controller;

  @override
  void initState() {
    controller = new TabController(length: 2, vsync: this);
    super.initState();
  }




  Widget build(BuildContext context) {

    return InkWell(
        child:Card(

            elevation: 5,
            color: Colors.white,
            shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[


                SizedBox(
                  width: double.infinity,
                  height: 70,
                  child: Container(
                      decoration:BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0),topRight:Radius.circular(15.0), )
                      ),

                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(widget.country.country,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30,color: Colors.white),
                            ),
                          ),
                        )
                      )
                  ),
                ),



                SizedBox(

                  child:  Container(
                    color: Colors.blue,
                    child:new TabBar(
                        controller: controller,
                        labelColor: Colors.white,
                        indicatorColor: Colors.lightGreenAccent,
                        tabs:[


                          new Tab(

                            text: "Total",

                          ),


                          new Tab(

                            text: "New",
                          ),



                        ]
                    ),
                  ),


                ),

                SizedBox(
                  height: 140,
                  width:(350 / 375)*MediaQuery.of(context).size.width,
                  child: TabBarView(
                    controller: controller,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(vertical:(10/812)*MediaQuery.of(context).size.height,horizontal: (10 / 375) *MediaQuery.of(context).size.width,),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "Confirmed: "+widget.country.totalConfirmed.toString(),
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.blue),
                              ),
                            ),

                            SizedBox(height: (10/812)*MediaQuery.of(context).size.height,),

                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "Deaths: "+widget.country.totalDeaths.toString(),
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.red),
                              ),
                            ),
                            SizedBox(height: (10/812)*MediaQuery.of(context).size.height,),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "Recovered: "+widget.country.totalRecovered.toString(),
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.green),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(vertical:(10/812)*MediaQuery.of(context).size.height,horizontal: (10 / 375) *MediaQuery.of(context).size.width,),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "Confirmed: "+widget.country.newConfirmed.toString(),
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.blue),
                              ),
                            ),

                            SizedBox(height: (10/812)*MediaQuery.of(context).size.height,),

                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "Deaths: "+widget.country.newDeaths.toString(),
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.red),
                              ),
                            ),
                            SizedBox(height: (10/812)*MediaQuery.of(context).size.height,),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "Recovered: "+widget.country.newRecovered.toString(),
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.green),
                              ),
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                )


              ],
            )
        ),
        onTap:(){
          context.push('/detail/'+widget.country.country);
        }
    );
  }
}









