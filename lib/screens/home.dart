import 'package:flutter/material.dart';
import 'package:flutter_test_app/screens/event.dart';
import 'package:flutter_test_app/screens/map.dart';
import 'package:flutter_test_app/screens/words.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _selectedIndex = 0;

//  bool _isCreateEventButton = false;
//  IconData _floatingButtonIcon = Icons.create;
//  double _buttonHeight = 60;
//  double _buttonWidth = 60;
//  double _buttonIconSize = 25;
//  MaterialColor _buttonColor = Colors.blue;
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
//      floatingActionButton: _selectedIndex == 1
//          ? Container(
//              height: _buttonHeight,
//              width: _buttonWidth,
//              child: FloatingActionButton(
//                  child: Icon(
//                    _floatingButtonIcon,
//                    size: _buttonIconSize,
//                  ),
//                  backgroundColor: _buttonColor,
//                  onPressed: () {
//                    _isCreateEventButton ? createEvent() : createEventButton();
//                  }))
//          : null,
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
            new Tab(icon: new Icon(Icons.account_circle)),
            new Tab(icon: new Icon(Icons.location_on)),
          ])),
    );
  }

//  createEventButton() {
//    setState(() {
//      _isCreateEventButton = true;
//      _buttonHeight = 80;
//      _buttonWidth = 80;
//      _floatingButtonIcon = Icons.event;
//      _buttonColor = Colors.cyan;
//      _buttonIconSize = 45;
//    });
//  }
//
//  defaultButton() {
//    setState(() {
//      _isCreateEventButton = false;
//      _buttonHeight = 60;
//      _buttonWidth = 60;
//      _floatingButtonIcon = Icons.add;
//      _buttonColor = Colors.blue;
//      _buttonIconSize = 25;
//    });
//  }

  selectTab() {
    print("ciao");
    setState(() {
      _selectedIndex = _tabController.index;
    });
  }

//  createEvent() {
//    defaultButton();
//    Navigator.push(
//      context,
//      MaterialPageRoute(builder: (context) => Event()),
//    );
//  }
}
