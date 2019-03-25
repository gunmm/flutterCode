import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class HomePageContent extends StatefulWidget {
  @override
  createState() => new HomePageContentState();
}

class HomePageContentState extends State<HomePageContent> {

  int _textCount = 1;

  _btnSelect(int currectCount) {
    setState(() {
      _textCount = currectCount;
    });
  }

  static const methodChannel = const MethodChannel('methodChannel');
  _popSaved() {
    _iOSPushToVC();

  }

  _iOSPushToVC() async {
    await methodChannel.invokeMethod('disMissFlutterVc', '你要被销毁了');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: new AppBar(
        title: new Text("Home"),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.layers_clear), onPressed: _popSaved),
        ],
      ),

      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  gradient: LinearGradient(
                      colors: [Colors.red, Colors.orange[700]]),
                  borderRadius: BorderRadius.circular(3),
                  boxShadow: [ //阴影
                    BoxShadow(
                        color: Colors.black54,
                        offset: Offset(2.0, 2.0),
                        blurRadius: 4.0
                    ),
                  ],
                ),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: Text("今天是个好日子"*_textCount,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
              Wrap(
                spacing: 8.0, // 主轴(水平)方向间距
//                mainAxisSize: MainAxisSize.min,
//                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.blue,
                    child: Text("长度1111111111111111111111111111111111111111",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    textColor: Colors.white,
                    onPressed: () => {_btnSelect(1)},

                  ),
                  RaisedButton(
                    color: Colors.blue,
                    child: Text("长度2",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    textColor: Colors.white,
                    onPressed: () => {_btnSelect(2)},
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    child: Text("长度3",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    textColor: Colors.white,
                    onPressed: () => {_btnSelect(3)},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}