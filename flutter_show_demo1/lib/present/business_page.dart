import 'package:flutter/material.dart';

class BuinessPageContent extends StatefulWidget {
  @override
  createState() => new BuinessPageState();
}

class BuinessPageState extends State<BuinessPageContent> {


  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: new AppBar(
        title: new Text("BuinessPage"),
      ),

      body: new Text("BuinessPage"),
    );
  }
}