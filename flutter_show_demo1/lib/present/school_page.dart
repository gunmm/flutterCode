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

      body: Container(
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
//          verticalDirection: VerticalDirection.up,

//          textDirection: TextDirection.rtl,


          children: <Widget>[
//            Row(
//              mainAxisSize: MainAxisSize.min,
//              verticalDirection: VerticalDirection.down,
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                Container(
//                  color: Colors.red,
//                  child: Text("我是第11个"),
//                ),
//                Container(
//                  height: 60,
//                  color: Colors.green,
//                  child: Text("我是第12个"),
//                ),
//              ],
//            ),

            Container(
              color: Colors.red,
              child: Text("我是第1个"),
            ),

            Container(
              color: Colors.red,
              child: Text("我是第2个第2个"),
            ),
            Container(
              color: Colors.red,
              child: Text("我是第3个第3个第3个"),
            ),
          ],
        ),
      ),


    );
  }
}