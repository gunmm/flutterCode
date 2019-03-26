import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class HomePageContent extends StatefulWidget {
  @override
  createState() => new HomePageContentState();
}

class HomePageContentState extends State<HomePageContent> {

  int _textCount = 1;

  TextEditingController _textEditingController = new TextEditingController();
  String _firstTextString = "";
  String _secondTextString = "";

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

      body:SingleChildScrollView(
        child: Center(
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
                  child: Text("颠三倒四多说的是"*_textCount,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
                Wrap(
                  spacing: 8.0, // 主轴(水平)方向间距
                  crossAxisAlignment: WrapCrossAlignment.start, //设置对齐方式
                  verticalDirection: VerticalDirection.up,   //和crossAxisAlignment一起控制对齐方式
                  children: <Widget>[
                    SizedBox(
                      height: 100,
                      width: 150,
                      child: RaisedButton(
                        color: Colors.blue,
                        child: Text("长度1",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        textColor: Colors.white,
                        onPressed: () => {_btnSelect(1)},
                      ),
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



                TextField(
                  controller: _textEditingController,
                  onChanged: (v) {
                    setState(() {
                      _secondTextString = _textEditingController.text;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "用户名或邮箱",
                    prefixIcon: Icon(Icons.person),
                  ),
                ),

                Wrap(
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
                      child: Text(_firstTextString,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
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
                      child: Text(_secondTextString,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ],
                ),


                Wrap(
                  spacing: 20,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.blue,
                      child: Text("set",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      textColor: Colors.white,
                      onPressed: () {
                        setState(() {
                          _firstTextString = _textEditingController.text;

                        });
                      },
                    ),
                    RaisedButton(
                      color: Colors.blue,
                      child: Text("clear",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      textColor: Colors.white,
                      onPressed: () {
                        setState(() {
                          _textEditingController.text = "";
                          _firstTextString = "";
                          _secondTextString = "";
                        });
                      },
                    ),
                  ],
                ),

                Wrap(
//                textDirection: TextDirection.rtl,    文字方向   从左向右还是从右向左
//                alignment: WrapAlignment.start,   //没试出来结果
                  crossAxisAlignment: WrapCrossAlignment.center, //设置居中对齐
                  spacing: 10,
                  children: <Widget>[
                    Image(
                      image: AssetImage("images/image1.png"),
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                      colorBlendMode: BlendMode.difference,
                    ),

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
//                      borderRadius: BorderRadius.circular(50),
                        boxShadow: [ //阴影
                          BoxShadow(
                              color: Colors.black54,
                              offset: Offset(2.0, 2.0),
                              blurRadius: 4.0
                          ),
                        ],
                      ),
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child:  ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: FadeInImage.assetNetwork(
                            placeholder: "images/image2.png",
                            image: "netUrl",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),


              ],
            ),





          ),
        ),
      ),
    );
  }
}