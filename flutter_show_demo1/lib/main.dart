import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter_show_demo1/present/apple_present.dart';
import 'apple_push.dart';
import 'flutter_page.dart';
import 'package:flutter/services.dart';



import 'dart:async';


//void main() => runApp(_widgetForRoute(ui.window.defaultRouteName));
const MethodChannel _channel = const MethodChannel('flutter_bugly');

void main() {
  FlutterError.onError = (FlutterErrorDetails details) async {
    Zone.current.handleUncaughtError(details.exception, details.stack);
  };

  runZoned<Future<Null>>(() async {
    runApp(_widgetForRoute(ui.window.defaultRouteName));
  }, onError: (error, stackTrace) async {
    var errorStr = error.toString();
    var map = {};
    map.putIfAbsent("crash_message", () => errorStr);
    map.putIfAbsent("crash_detail", () => stackTrace.toString());
    await _channel.invokeMethod('postCatchedException', map);
  });
}

Widget _widgetForRoute(String route) {
//  return new FlutterPushPage(titleString: "titleString", contentString: "contentString",);
//  return new PresentApp();
  switch (route) {
    case 'applePresent':
      return new PresentApp();
    case 'applePush':
      return new PushApp();
    case 'flutterPage':
      return new FlutterApp();
    default:
      return Center(
        child: Text('Unknown route: $route', textDirection: TextDirection.ltr),
      );
  }
}




