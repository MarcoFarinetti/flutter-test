import 'package:flutter/material.dart';
import 'package:flutter_test_app/screens/map.dart';
import 'package:flutter_test_app/screens/words.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _selectedIndex = 0;
  static const List<String> titles = <String>['Home', 'Map'];
  final List<Widget> _children = <Widget>[RandomWords(), Map()];

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[_selectedIndex]),
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.list),
//            onPressed: _pushSaved,
//          )
//        ],
      ),
//      body: _children[_selectedIndex],
      body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: <Widget>[RandomWords(), Map()]),
//      bottomNavigationBar: BottomNavigationBar(
//        items: const <BottomNavigationBarItem>[
//          BottomNavigationBarItem(
//            icon: Icon(Icons.home),
//            title: Text('Home'),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.map),
//            title: Text('Map'),
//          ),
//        ],
//        currentIndex: _selectedIndex,
//        selectedItemColor: Colors.amber[800],
//        onTap: selectTab,
//      ),
      bottomNavigationBar: Material(
          color: Colors.blue,
          child: new TabBar(controller: _tabController, tabs: <Tab>[
            new Tab(icon: new Icon(Icons.home)),
            new Tab(icon: new Icon(Icons.map)),
          ])),
    );
  }

  void selectTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
