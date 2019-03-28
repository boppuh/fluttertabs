import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import './home.dart';
import './exercises.dart';
import './messaging.dart';
import './profile.dart';

class Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(
        child: Center(
          child: FlatButton(
            child: const Text('Go!'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => Page()),
              );
              // push another route
            },
          ),
        ),
      ),
    );
  }
}

class CustomTab extends StatefulWidget {
  final Widget child;
  //final Widget tabContext;

  CustomTab({@required this.child});

  BuildContext get tabContext => null;

  @override
  _CustomTabState createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab> {
  BuildContext tabContext;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabView(
      builder: (BuildContext context) {
        tabContext = context;
        return widget.child;
      },
    );
  }
}

class Tabbed extends StatefulWidget {
  @override
  _TabbedState createState() => _TabbedState();
}

class _TabbedState extends State<Tabbed> {
  int _currentTab = 0;

  final List<CustomTab> tabs = <CustomTab>[
    CustomTab(
      child: HomePage(),
    ),
    CustomTab(
      child: ExercisesPage(),
    ),
    CustomTab(
      child: MessagingPage(),
    ),
    CustomTab(
      child: ProfilePage(),
    ),
  ];

  Future<Null> _setTab(int index) async {
    if (_currentTab == index) {
      if (Navigator.of(tabs[index].tabContext).canPop()) {
        Navigator.of(tabs[index].tabContext)
            .popUntil((Route<dynamic> r) => r.isFirst);
      }
      return;
    }
    setState(() {
      _currentTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          _buildStack(),
          _buildTabs(),
        ],
      ),
    );
  }

  Widget _buildStack() {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: IndexedStack(
          sizing: StackFit.expand,
          index: _currentTab,
          children: tabs,
        ),
      ),
    );
  }

  Widget _buildTabs() {
    return SafeArea(
      top: false,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
          border: Border(
            top: BorderSide(color: Color.fromRGBO(58, 66, 86, 0.3)),
          ),
        ),
        height: 55.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              iconSize: 30.0,
              color: _currentTab == 0
                  ? Color.fromRGBO(58, 66, 86, 1.0)
                  : Color.fromRGBO(58, 66, 86, 0.3),
              icon: const Icon(Icons.home),
              onPressed: () {
                _setTab(0);
              },
            ),
            IconButton(
              iconSize: 30.0,
              color: _currentTab == 1
                  ? Color.fromRGBO(58, 66, 86, 1.0)
                  : Color.fromRGBO(58, 66, 86, 0.3),
              icon: const Icon(Icons.search),
              onPressed: () {
                _setTab(1);
              },
            ),
            IconButton(
              iconSize: 30.0,
              color: _currentTab == 2
                  ? Color.fromRGBO(58, 66, 86, 1.0)
                  : Color.fromRGBO(58, 66, 86, 0.3),
              icon: const Icon(Icons.notifications),
              onPressed: () {
                _setTab(2);
              },
            ),
            IconButton(
              iconSize: 30.0,
              color: _currentTab == 3
                  ? Color.fromRGBO(58, 66, 86, 1.0)
                  : Color.fromRGBO(58, 66, 86, 0.3),
              icon: const Icon(Icons.settings),
              onPressed: () {
                _setTab(3);
              },
            )
          ],
        ),
      ),
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Tabbed(),
    );
  }
}

void main() => runApp(new App());
/*import 'package:flutter/material.dart';


import './home.dart';
import './exercises.dart';
import './messaging.dart';
import './profile.dart';

import './app.dart';

import './colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JPhit',
      theme: ThemeData(
        primarySwatch: black,
      ),
      home: App(),
    );
  }
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  int _bottomNavBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // brightness: Brightness.light,
        primarySwatch: black,
        accentColor: Colors.lightBlue,
      ),
      home: new DefaultTabController(
        length: 4,
        child: new Scaffold(
          appBar: AppBar(
            title: Text('Home')
          ),
          body:TabBarView(
            children: <Widget>[
              HomePage(),
              ExercisesPage(),
              MessagingPage(),
              ProfilePage(),
            ],
          ),
          backgroundColor: Colors.black,
          bottomNavigationBar: new BottomNavigationBar(
            currentIndex: _bottomNavBarIndex,
            onTap: (int index) {
              _bottomNavBarIndex = index;
            },
            items: [
              BottomNavigationBarItem(
                icon: new Icon(Icons.home),
                title: Text('Home')
              ),
              BottomNavigationBarItem(
                icon: new Icon(Icons.fitness_center),
                title: Text('Exercises')
              ),
              BottomNavigationBarItem(
                icon: new Icon(Icons.message),
                title: Text('Messages')
              ),
              BottomNavigationBarItem(
                icon: new Icon(Icons.person),
                title: Text('Profile')
              ),
            ],

            /*
            labelColor: Colors.lightBlue,
            unselectedLabelColor: white,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Colors.lightBlue,
            */
          ),
        ),
      ),
    );
  }
}
*/
