import 'package:flutter/material.dart';


class FlutterPushPage extends StatefulWidget {
  final String titleString;
  final String contentString;

  FlutterPushPage({
    this.titleString,
    this.contentString,
  });
  FlutterPushPageStatus createState() => new FlutterPushPageStatus();

}


class FlutterPushPageStatus extends State<FlutterPushPage> {

  _tapRecognizer() {

  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text(widget.titleString),
          ),
          body: Center(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,



                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("hello world"),
                      Text(" I love beijing"),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("hello world"),
                      Text(" I love beijing"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    textDirection: TextDirection.rtl,
                    children: <Widget>[
                      Text(" hello world "),
                      Text(" I am Jack "),
                    ],
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.end,
                    verticalDirection: VerticalDirection.down,
                    alignment: WrapAlignment.center,

                    children: <Widget>[
                      Text(" hello world ", style: TextStyle(fontSize: 30.0),),
                      Text(" I am Jack "),
                    ],
                  ),



                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    crossAxisAlignment: WrapCrossAlignment.end,
                    alignment: WrapAlignment.center,
                    children: <Widget>[
                      new Chip(
                        label: new Text("Hamilton"),
                        avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
                        backgroundColor:  Colors.red,
                      ),
                      new Chip(
                        label: new Text("Hamilton"),
                        avatar: new CircleAvatar(backgroundColor: Colors.orange, child: Text('A')),
                        backgroundColor:  Colors.blue,
                      ),
                      new Chip(
                        label: new Text("Hamilton"),
                        avatar: new CircleAvatar(backgroundColor: Colors.green, child: Text('A')),
                        backgroundColor:  Colors.blue,
                      ),
                      new Chip(
                        label: new Text("Hamilton"),
                        avatar: new CircleAvatar(backgroundColor: Colors.black, child: Text('A')),
                        backgroundColor:  Colors.blue,
                      ),
                    ],

                  ),


                  Transform(
                    transform: new Matrix4.skewY(-0.3),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: double.infinity,
                        minHeight: 20.0,
                      ),
                      child: Container(
                        height: 10,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                  ),


                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Colors.red,Colors.orange[700]]),
                        borderRadius: BorderRadius.circular(3),
                        boxShadow: [ //阴影
                          BoxShadow(
                              color:Colors.black54,
                              offset: Offset(2.0,2.0),
                              blurRadius: 4.0
                          )
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: SizedBox(
                          width: 80,
                          height: 30,
                          child: DecoratedBox(
                            decoration: BoxDecoration(color: Colors.red),
                            child: Center(
                              child: Transform.translate(
                                offset: Offset(-5, -5),
                                child: Text("minzhe",style: TextStyle(color: Colors.white)),
                              ),

                            ),
                          ),
                        ),
                      ),

                    ),
                  ),










                ],
              ),
            ),



          ),





        ),
    );


  }

}
