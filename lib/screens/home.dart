import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/screens/map.dart';
import 'package:flutter_test_app/screens/words.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int _selectedIndex = 0;

  static const List<String> titles = <String>['Home', 'Map'];

  final List<Widget> _children = <Widget>[RandomWords(), Map()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Add from here...
      appBar: AppBar(
        title: Text(titles[_selectedIndex]),
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.list),
//            onPressed: _pushSaved,
//          )
//        ],
      ),
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('Map'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: selectTab,
      ),
    );
  }

  void selectTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
