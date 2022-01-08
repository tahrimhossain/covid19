import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SymptomsAndPreventions extends StatefulWidget{
  @override
  _SymptomsAndPreventionsState createState()=> _SymptomsAndPreventionsState();
}

class _SymptomsAndPreventionsState extends State<SymptomsAndPreventions>{

  late PageController _controller;

  @override
  void initState()
  {
    _controller = new PageController(initialPage:0,viewportFraction: 0.95);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(

        body: ListView(
          padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top == 0? 20 : MediaQuery.of(context).viewPadding.top,right: 10,bottom: 20),
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    minWidth: 20.0,
                    textColor: Colors.black,
                    child: Icon(
                      Icons.arrow_back,
                      size: 20,
                    ),
                    shape: CircleBorder(),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text("Symptoms",style:TextStyle(fontWeight: FontWeight.bold,fontSize:30,color: Colors.black),),
                  ),
                )
              ],
            ),
            SizedBox(
              height: (10/812)*MediaQuery.of(context).size.height,
            ),
            SizedBox(
              height: (250/812)*MediaQuery.of(context).size.height,
              child: PageView(
                controller: _controller,
                physics: ClampingScrollPhysics(),
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    color: Colors.red,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: (10/812)*MediaQuery.of(context).size.height,),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Container(
                              height: (90/812)*MediaQuery.of(context).size.height,
                              child: Image.asset("images/fever.png",fit: BoxFit.fitWidth,),
                            ),
                          ),
                          Divider(
                            color: Colors.white,
                            thickness: 2,
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text("Fever",style:TextStyle(fontWeight: FontWeight.bold,fontSize:20,color: Colors.white),),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    color: Colors.red,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: (10/812)*MediaQuery.of(context).size.height,),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Container(
                              height: (90/812)*MediaQuery.of(context).size.height,
                              child: Image.asset("images/cough.png",fit: BoxFit.fitWidth,),
                            ),
                          ),
                          Divider(
                            color: Colors.white,
                            thickness: 2,
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text("Dry Cough",style:TextStyle(fontWeight: FontWeight.bold,fontSize:20,color: Colors.white),),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    color: Colors.red,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: (10/812)*MediaQuery.of(context).size.height,),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Container(
                              height: (90/812)*MediaQuery.of(context).size.height,
                              child: Image.asset("images/headache.png",fit: BoxFit.fitWidth,),
                            ),
                          ),
                          Divider(
                            color: Colors.white,
                            thickness: 2,
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text("Headache",style:TextStyle(fontWeight: FontWeight.bold,fontSize:20,color: Colors.white),),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    color: Colors.red,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: (10/812)*MediaQuery.of(context).size.height,),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Container(
                              height: (90/812)*MediaQuery.of(context).size.height,
                              child: Image.asset("images/sore-throat.png",fit: BoxFit.fitWidth,),
                            ),
                          ),
                          Divider(
                            color: Colors.white,
                            thickness: 2,
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text("Sore Throat",style:TextStyle(fontWeight: FontWeight.bold,fontSize:20,color: Colors.white),),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    color: Colors.red,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: (10/812)*MediaQuery.of(context).size.height,),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Container(
                              height: (90/812)*MediaQuery.of(context).size.height,
                              child: Image.asset("images/breathing.png",fit: BoxFit.fitWidth,),
                            ),
                          ),
                          Divider(
                            color: Colors.white,
                            thickness: 2,
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text("Difficulty Breathing",style:TextStyle(fontWeight: FontWeight.bold,fontSize:20,color: Colors.white),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: (10/812)*MediaQuery.of(context).size.height,
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text("Preventions",style:TextStyle(fontWeight: FontWeight.bold,fontSize:30,color: Colors.black),),
            ),

            Padding(

              padding: EdgeInsets.only(left: (12/375)*MediaQuery.of(context).size.width,),
              child:Column(

                  children:<Widget>[
                    Align(
                      alignment:Alignment.topLeft,
                      child:SizedBox(

                        height: (150/812)*MediaQuery.of(context).size.height,
                        width: (350/375)*MediaQuery.of(context).size.width,

                        child:Card(

                          elevation: 10,
                          color: Colors.lightBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            height: (150/812)*MediaQuery.of(context).size.height,
                            width :(200/375)*MediaQuery.of(context).size.width,
                            child: Row(

                              children: <Widget>[

                                Padding(
                                  padding: EdgeInsets.only(left: (10/375)*MediaQuery.of(context).size.width),
                                  child: SizedBox(
                                    height:(150/812)*MediaQuery.of(context).size.height,
                                    width: (60/375)*MediaQuery.of(context).size.width,
                                    child: new Image.asset(
                                      'images/water.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: (120/812)*MediaQuery.of(context).size.height,
                                  width: (15/375)*MediaQuery.of(context).size.width,
                                  child: VerticalDivider(
                                    color: Colors.black,
                                    width: (10/375)*MediaQuery.of(context).size.width,
                                  ),
                                ),

                                Expanded(

                                  child: Text(
                                    "Wash your hands often with soap and water for at least 20 seconds especially after you have been in a public place, or after blowing your nose, coughing, or sneezing.",
                                    style: TextStyle(fontSize: (16/812)*MediaQuery.of(context).size.height,),
                                    overflow: TextOverflow.clip,
                                    maxLines: 6,

                                  ),
                                ),

                                SizedBox(width: (10/375)*MediaQuery.of(context).size.width,),





                              ],







                            ),
                          ),


                        ),
                      ),
                    ),


                    SizedBox(height: (10/812)*MediaQuery.of(context).size.height,),


                    Align(
                      alignment:Alignment.topLeft,
                      child:SizedBox(

                        height: (150/812)*MediaQuery.of(context).size.height,
                        width: (350/375)*MediaQuery.of(context).size.width,

                        child: Card(

                          elevation: 10,
                          color: Colors.lightBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            height: (150/812)*MediaQuery.of(context).size.height,
                            width :(200/375)*MediaQuery.of(context).size.width,
                            child: Row(

                              children: <Widget>[

                                Padding(
                                  padding: EdgeInsets.only(left: (10/375)*MediaQuery.of(context).size.width),
                                  child: SizedBox(
                                    height:(150/812)*MediaQuery.of(context).size.height,
                                    width: (60/375)*MediaQuery.of(context).size.width,
                                    child: new Image.asset(
                                      'images/mouth.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: (120/812)*MediaQuery.of(context).size.height,
                                  width: (15/375)*MediaQuery.of(context).size.width,
                                  child: VerticalDivider(
                                    color: Colors.black,
                                    width: (10/375)*MediaQuery.of(context).size.width,

                                  ),
                                ) ,

                                Expanded(

                                  child: Text(
                                    "Avoid touching any part of your face or head, including your mouth, nose, and eyes. Also avoid biting your fingernails.",
                                    style: TextStyle(fontSize: (16/812)*MediaQuery.of(context).size.height),
                                    overflow: TextOverflow.clip,
                                    maxLines: 7,

                                  ),
                                ),

                                SizedBox(width: (10/375)*MediaQuery.of(context).size.width,),





                              ],







                            ),
                          ),


                        ),
                      ),
                    ),



                    SizedBox(height: (10/812)*MediaQuery.of(context).size.height,),

                    Align(
                      alignment:Alignment.topLeft,
                      child:SizedBox(

                        height: (150/812)*MediaQuery.of(context).size.height,
                        width: (350/375)*MediaQuery.of(context).size.width,

                        child: Card(

                          elevation: 10,
                          color: Colors.lightBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            height: (150/812)*MediaQuery.of(context).size.height,
                            width :(200/375)*MediaQuery.of(context).size.width,
                            child: Row(

                              children: <Widget>[

                                Padding(
                                  padding: EdgeInsets.only(left: (10/375)*MediaQuery.of(context).size.width),
                                  child: SizedBox(
                                    height:(150/812)*MediaQuery.of(context).size.height,
                                    width: (60/375)*MediaQuery.of(context).size.width,
                                    child: new Image.asset(
                                      'images/no-handshake.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: (120/812)*MediaQuery.of(context).size.height,
                                  width: (15/375)*MediaQuery.of(context).size.width,
                                  child: VerticalDivider(
                                    color: Colors.black,
                                    width: (10/375)*MediaQuery.of(context).size.width,

                                  ),
                                ),

                                Expanded(

                                  child: Text(
                                    "Stop shaking hands and hugging people — for now. Skin-to-skin contact can transmit SARS-CoV-2 from one person to another. ",
                                    style: TextStyle(fontSize: (16/812)*MediaQuery.of(context).size.height),
                                    overflow: TextOverflow.clip,
                                    maxLines: 7,

                                  ),
                                ),

                                SizedBox(width: (10/812)*MediaQuery.of(context).size.height,),





                              ],







                            ),
                          ),


                        ),
                      ),
                    ),


                    SizedBox(height: (10/812)*MediaQuery.of(context).size.height,),


                    Align(
                      alignment:Alignment.topLeft,
                      child:SizedBox(

                        height: (150/812)*MediaQuery.of(context).size.height,
                        width: (350/375)*MediaQuery.of(context).size.width,

                        child: Card(

                          elevation: 10,
                          color: Colors.lightBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            height: (150/812)*MediaQuery.of(context).size.height,
                            width :(200/375)*MediaQuery.of(context).size.width,
                            child: Row(

                              children: <Widget>[

                                Padding(
                                  padding: EdgeInsets.only(left: (10/375)*MediaQuery.of(context).size.width),
                                  child: SizedBox(
                                    height:(150/812)*MediaQuery.of(context).size.height,
                                    width: (60/375)*MediaQuery.of(context).size.width,
                                    child: new Image.asset(
                                      'images/coronavirus.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: (120/812)*MediaQuery.of(context).size.height,
                                  width: (15/375)*MediaQuery.of(context).size.width,
                                  child: VerticalDivider(
                                    color: Colors.black,
                                    width: (10/375)*MediaQuery.of(context).size.width,

                                  ),
                                ),

                                Expanded(

                                  child: Text(
                                    "Being in a group or gathering makes it more likely that you’ll be in close contact with someone.This includes avoiding all religious places of worship, parks or beaches.",
                                    style: TextStyle(fontSize: (16/812)*MediaQuery.of(context).size.height),
                                    overflow: TextOverflow.clip,
                                    maxLines: 7,

                                  ),
                                ),

                                SizedBox(width: (10/812)*MediaQuery.of(context).size.height,),





                              ],







                            ),
                          ),


                        ),
                      ),
                    ),



                    SizedBox(height: (10/812)*MediaQuery.of(context).size.height,),

                    Align(
                      alignment:Alignment.topLeft,
                      child:SizedBox(

                        height: (150/812)*MediaQuery.of(context).size.height,
                        width: (350/375)*MediaQuery.of(context).size.width,

                        child: Card(

                          elevation: 10,
                          color: Colors.lightBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            height: (150/812)*MediaQuery.of(context).size.height,
                            width :(200/375)*MediaQuery.of(context).size.width,
                            child: Row(

                              children: <Widget>[

                                Padding(
                                  padding: EdgeInsets.only(left: (10/375)*MediaQuery.of(context).size.width),
                                  child: SizedBox(
                                    height:(150/812)*MediaQuery.of(context).size.height,
                                    width: (60/375)*MediaQuery.of(context).size.width,
                                    child: new Image.asset(
                                      'images/medical-mask.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: (120/812)*MediaQuery.of(context).size.height,
                                  width: (15/375)*MediaQuery.of(context).size.width,
                                  child: VerticalDivider(
                                    color: Colors.black,
                                    width: (10/375)*MediaQuery.of(context).size.width,

                                  ),
                                ),

                                Expanded(

                                  child: Text(
                                    "The Centers for Disease Control and Prevention (CDC) recommends that almost everyone wears a cloth face mask in public settings where physical distancing may be difficult. ",
                                    style: TextStyle(fontSize: (16/812)*MediaQuery.of(context).size.height),
                                    overflow: TextOverflow.clip,
                                    maxLines: 15,

                                  ),
                                ),

                                SizedBox(height: (10/812)*MediaQuery.of(context).size.height,),





                              ],







                            ),
                          ),


                        ),
                      ),
                    ),
                    SizedBox(height: (20/812)*MediaQuery.of(context).size.height,),
                  ]
              ),
            ),

          ],
        ),
      ),
    );
  }
}