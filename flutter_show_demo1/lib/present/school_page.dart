import 'package:flutter/material.dart';

class SchoolPageContent extends StatefulWidget {
  @override
  createState() => new SchoolPageState();
}

class SchoolPageState extends State<SchoolPageContent> {


  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: new AppBar(
        title: new Text("SchoolPage"),
      ),

      body: new Text("SchoolPage"),
    );
  }
}