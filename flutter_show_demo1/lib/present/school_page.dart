import 'package:flutter/material.dart';

class SchoolPageContent extends StatefulWidget {
  @override
  createState() => new SchoolPageState();
}

class SchoolPageState extends State<SchoolPageContent> {


  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: new AppBar(
        title: new Text("SchoolPage"),
      ),

      body: Column(
        children: <Widget>[
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  height: 30,
                  color: Colors.red,
                ),
              ),

              Expanded(
                flex: 2,
                child: Container(
                  height: 30,
                  color: Colors.green,
                ),
              ),
            ],
          ),

          Expanded(
            child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Container(
                  color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.green,
                          child: Text("hello world "),
                        ),


                      ),
                      Expanded(
                        flex: 2,
                        child: Text("I am Jack "),
                      ),

                    ],
                  ),
                ),



            ),

          ),
        ],
      ),
    );
  }
}