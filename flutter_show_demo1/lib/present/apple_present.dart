import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'home_page.dart';
import 'business_page.dart';
import 'school_page.dart';

class PresentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new PresentPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PresentPage extends StatefulWidget {
  @override
  createState() => new PresentPageState();
}

class PresentPageState extends State<PresentPage> {

  int _selectTabBarIndex = 0;

  _onSelectTabBarItemTap(int index) {
    setState(() {
      _selectTabBarIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      bottomNavigationBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.business), title: Text("Business")),
          BottomNavigationBarItem(icon: Icon(Icons.school), title: Text("School")),
        ],
        currentIndex: _selectTabBarIndex,
        activeColor: Colors.blue,
        onTap: _onSelectTabBarItemTap,
      ),
      body: IndexedStack(
        children: <Widget>[
          HomePageContent(),
          BuinessPageContent(),
          SchoolPageContent(),
        ],
        index: _selectTabBarIndex,
      ),
    );
  }
}