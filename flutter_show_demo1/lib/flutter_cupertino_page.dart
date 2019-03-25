import 'package:flutter/cupertino.dart';

class FlutterCupertinoPage extends StatelessWidget {
  final String titleString;
  final String contentString;


  FlutterCupertinoPage({
    this.titleString,
    this.contentString,
  });

  @override
  Widget build(BuildContext context) {
    return new CupertinoPageScaffold(
      navigationBar: new CupertinoNavigationBar(
        middle: new Text(titleString),

      ),

      child: new Center(
        child: new CupertinoButton(
            color: CupertinoColors.activeBlue,
            child: Text(contentString),
            onPressed: () {}
        ),

      ),

    );
  }
}