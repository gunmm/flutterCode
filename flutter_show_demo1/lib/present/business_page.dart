import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class BuinessPageContent extends StatefulWidget {
  @override
  createState() => new BuinessPageState();
}

class BuinessPageState extends State<BuinessPageContent> {


  static const loadingTag = "##loading##";

  var _words = <String>[loadingTag];

  _loadData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(_words.length-1,
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList()
      );

      setState(() {

      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: new AppBar(
        title: new Text("BuinessPage"),
      ),

      body: Column(
        children: <Widget>[
          ListTile(title:Text("商品列表")),
          Expanded(
              child: Scrollbar(
                child: ListView.separated(
                  itemCount: _words.length,
                  itemBuilder: (context, index) {
                    if(_words[index] == loadingTag) {
                      if(_words.length-1 < 60) {
                        _loadData();
                        return Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(16),
                          child: SizedBox(
                              width: 24.0,
                              height: 24.0,
                              child: CircularProgressIndicator(strokeWidth: 2.0)
                          ),
                        );
                      } else {
                        return Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(16),
                          child: Text("没有更多数据",
                            style: TextStyle(color: Colors.grey),
                          ),
                        );
                      }
                    }
                    return ListTile(title: Text(_words[index]));
                  },
                  separatorBuilder: (context, index) => Divider(height: .0,),
                ),
              ),
          ),

        ],
      ),
    );
  }
}