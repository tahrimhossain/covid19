import 'package:covid19/Views/CountryCard.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../Models/Countries.dart';

class SearchPage extends StatefulWidget{
  final Countries countries;
  SearchPage(this.countries);
  _SearchPageState createState()=> _SearchPageState();
}

class _SearchPageState extends State<SearchPage>{

  TextEditingController controller = new TextEditingController();
  String filter = "";


  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        filter = controller.text;
      });
    });
    super.initState();
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }



  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top == 0? 20 : MediaQuery.of(context).viewPadding.top,right: 10),
            child: Row(
              children: [
                MaterialButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  minWidth: 20.0,
                  //color: Colors.blue,
                  textColor: Colors.blue,
                  child: Icon(
                    Icons.arrow_back,
                    size: 20,
                  ),
                  shape: CircleBorder(),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search a Country",
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: IconButton(
                        onPressed: () => controller.clear(),
                        icon: Icon(Icons.clear),

                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0))
                      ),
                      isDense: true,

                    ),
                    controller: controller,
                    autofocus: true,
                    textInputAction: TextInputAction.done,

                  ),
                ),
              ],
            ),
          ),
          new Expanded(

              child: Padding(
                padding:EdgeInsets.all(12),
                child: new ListView.builder
                  (
                  itemCount: widget.countries.countries!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return filter == "" ? new Container() : widget.countries.countries![index].country.toLowerCase().contains(filter.toLowerCase()) ? new CountryCard(widget.countries.countries![index]) : new Container();
                  },
                ),
              )


          ),
        ],
      ),
    );

  }

}