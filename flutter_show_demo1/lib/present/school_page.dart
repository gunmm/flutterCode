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

      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              left:10,
              top: 10,
              right: 10,
              bottom: 10,
              child: Container(
                color: Colors.red,
                child: Text("sds sdsd 1"),
              ),


            ),
            Text("I am Jack 3"),
          ],
        ),
      ),




//      Column(
//        children: <Widget>[
//          Row(
//            children: <Widget>[
//              Expanded(
//                flex: 2,
//                child: Container(
//                  height: 30,
//                  color: Colors.red,
//                ),
//              ),
//
//              Expanded(
//                flex: 2,
//                child: Container(
//                  height: 30,
//                  color: Colors.green,
//                ),
//              ),
//            ],
//          ),
//
//          Expanded(
//            flex: 1,
//            child: Container(
//              color: Colors.green,
//              child: Column(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  Text("hello world0 "),
//                ],
//              ),
//            ),
//          ),
//
//          Text("hello world1 "),
//          Expanded(
//            flex: 5,
//            child: Container(
//              color: Colors.red,
//              child: Column(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  Expanded(
//                    flex: 1,
//                    child: Container(
//                      color: Colors.green,
//                      child: Text("hello world2 "),
//                    ),
//
//
//                  ),
//                  Expanded(
//                    flex: 1,
//                    child: Text("I am Jack 3"),
//                  ),
//
//                ],
//              ),
//            ),
//          ),
//          Text("hello world4"),
//
//        ],
//      ),
    );
  }
}