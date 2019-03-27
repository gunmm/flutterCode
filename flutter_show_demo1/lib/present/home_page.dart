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
                //大文字
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

                //按钮
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

                //输入框
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

                //显示框
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

                //按钮
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

                //仿cell
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.0), //3像素圆角
                    color: Colors.black12,
//                    gradient: LinearGradient(
//                        colors: [Colors.black12, Colors.black12]), //背景
                  ),
//                  color: Colors.black12,
                  height: 80,
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 40,
                        height: 40,
                        margin: EdgeInsets.only(left: 13),
                        child: Stack(
                          alignment:Alignment.center ,
                          fit: StackFit.expand,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: FadeInImage.assetNetwork(
                                placeholder: "images/image2.png",
                                image: "netUrl",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              width: 15,
                              height: 15,
                              bottom: 0,
                              right: 0,
                              child: Image(
                                image: AssetImage("images/big_v_yellow.png"),
                              ),
                            ),
                          ],
                        ),



                      ),
                      Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 10, bottom: 4, right: 10),
                                  child: Text("爱吃鸭脖的YZ爱",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10,top: 4, right: 10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Container(
                                        child: Text("私密直播111",
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(left: 15),
                                          child: Text("2018-08-20 即将到期",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),

                              ],
                            ),
                          )
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 13),
                        width: 60,
                        height: 25,
                        child: FlatButton(
                            onPressed: () => {},
                            textColor: Colors.blue,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.5),
                              side: BorderSide(color: Colors.blue,width: 0.5),

                            ),
                            child: Text("续费",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            )
                        ),

                      ),



                    ],
                  ),
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