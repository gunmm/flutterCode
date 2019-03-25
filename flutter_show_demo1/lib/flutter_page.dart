import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'flutter_push_page.dart';
import 'flutter_cupertino_page.dart';

class FlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
        appBar: new AppBar(
          title: new Text('flutter nav'),
        ),
        body: new HomePage(),
      )
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 创建一个给native的channel (类似iOS的通知）
  static const methodChannel = const MethodChannel('flutterPageChannel');

  _iOSPushToVC() async {
    await methodChannel.invokeMethod('pushiOSVC', '我是flutter中传来的字符串');
  }

  _iOSShowAlert() async {
    Map<String, dynamic> map = {"title": "flutter提示", "content":"我是flutter调用弹出的原生alert"};
    await methodChannel.invokeMethod('showiOSAlert', map);
  }

  _iOSGetValue1() async {
    dynamic result;
    try {
      result = await methodChannel.invokeMethod('getiOSValue');
    } on PlatformException {
      result = "error";
    }
    if (result is Map) {
      print(result);
      String title = result["title"];
      String content = result["content"];

      Navigator.push(context,
          new MaterialPageRoute(
              builder: (context){
                return new FlutterCupertinoPage(
                    titleString: title,
                    contentString: content,
                );
              },
          ),
      );
    }
  }

  _iOSGetValue2() async {
    dynamic result;
    try {
      result = await methodChannel.invokeMethod('getiOSValue');
    } on PlatformException {
      result = "error";
    }
    if (result is Map) {
      print(result);
      String title = result["title"];
      String content = result["content"];

      Navigator.push(context,
        new MaterialPageRoute(
          builder: (context){
            return new FlutterPushPage(
              titleString: title,
              contentString: content,
            );
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return  new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new FlatButton(onPressed: () {
              _iOSPushToVC();
            }, child: new Text("推出一个iOS的VC")),
            new FlatButton(onPressed: () {
              _iOSShowAlert();
            }, child: new Text("展示一个iOS的alert")),
            new FlatButton(onPressed: () {
              _iOSGetValue1();
            }, child: new Text("pushCupertino风格")),
            new FlatButton(onPressed: () {
              _iOSGetValue2();
            }, child: new Text("pushMaterial风格")),
          ],
        ),
      );
  }
}