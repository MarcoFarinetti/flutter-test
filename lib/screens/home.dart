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

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
    _tabController.addListener(selectTab);
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
      ),
      body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: <Widget>[RandomWords(), Map()]),
      bottomNavigationBar: Material(
          color: Colors.blue,
          child: new TabBar(controller: _tabController, tabs: <Tab>[
            new Tab(icon: new Icon(Icons.account_circle)),
            new Tab(icon: new Icon(Icons.location_on)),
          ])),
    );
  }

  selectTab() {
    print("ciao");
    setState(() {
      _selectedIndex = _tabController.index;
    });
  }
}
