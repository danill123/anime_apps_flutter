import 'package:flutter/material.dart';
import 'TrendingAnime.dart';

class BottomNavPage extends StatefulWidget {
  @override
  _BottomNavPageState createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _selectTabIndex = 0;

  void _OnNavbarTapped(int index) {
    setState(() {
      _selectTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _listPage = <Widget>[TrendingAnime(), Text("data 2")];

    final _bottomNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(Icons.trending_up), title: Text('trending anime')),
      BottomNavigationBarItem(
          icon: Icon(Icons.list), title: Text('list anime')),
    ];

    final _bottomNavBar = BottomNavigationBar(
      items: _bottomNavBarItems,
      currentIndex: _selectTabIndex,
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.grey,
      onTap: _OnNavbarTapped,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation"),
      ),
      body: Center(child: _listPage[_selectTabIndex]),
      bottomNavigationBar: _bottomNavBar,
    );
  }
}
