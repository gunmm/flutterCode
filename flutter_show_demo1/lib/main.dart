import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'apple_present.dart';
import 'apple_push.dart';
import 'flutter_page.dart';
import 'flutter_push_page.dart';

void main() => runApp(_widgetForRoute(ui.window.defaultRouteName));

Widget _widgetForRoute(String route) {
  return new FlutterPushPage(titleString:"title", contentString:"content");
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




