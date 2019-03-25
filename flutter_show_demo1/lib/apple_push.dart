import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'flutter_push_page.dart';

class PushApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 创建一个给native的channel (类似iOS的通知）
  static const methodChannel = const MethodChannel('methodChannel');

  _iOSContentValue() async {
    dynamic result;
    try {
      result = await methodChannel.invokeMethod('iOSAndFlutter', "我是内容");
    } on PlatformException {
      result = "error";
    }
    if (result is String) {
      print(result);
      showModalBottomSheet(context: context, builder: (BuildContext context) {
        return new Container(
          child: new Center(
            child: new Text(result, style: new TextStyle(color: Colors.brown), textAlign: TextAlign.center,),
          ),
          height: 80.0,
        );
      });
    }
  }

  _pushNewPage() {
    Navigator.push(context,
      new MaterialPageRoute(
        builder: (context){
          return new FlutterPushPage(
            titleString: "title",
            contentString: "content",
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new FlatButton(onPressed: () {
              _iOSContentValue();
            }, child: new Text("传参到iOS并回调参数")),
            new FlatButton(onPressed: () {
              _pushNewPage();
            }, child: new Text("push")),
          ],
        ),
      ),
    );
  }
}
