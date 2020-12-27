import 'package:anime_apps_flutter/screens/views/ListAnime.dart';
import 'package:anime_apps_flutter/screens/views/ListManga.dart';
import 'package:anime_apps_flutter/screens/views/List_character.dart';
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
    final _listPage = <Widget>[
      TrendingAnime(),
      ListAnime(),
      ListManga(),
      List_Character(),
      Text("developer contact")
    ];

    final _bottomNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(Icons.trending_up), title: Text('trending anime')),
      BottomNavigationBarItem(
          icon: Icon(Icons.list), title: Text('list anime')),
      BottomNavigationBarItem(
          icon: Icon(Icons.book), title: Text('list manga')),
      BottomNavigationBarItem(
          icon: Icon(Icons.people_alt), title: Text('list character')),
      BottomNavigationBarItem(
          icon: Icon(Icons.contact_phone), title: Text('developer contact')),
    ];

    final _bottomNavBar = BottomNavigationBar(
      items: _bottomNavBarItems,
      currentIndex: _selectTabIndex,
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.grey,
      onTap: _OnNavbarTapped,
      elevation: 0,
    );

    return Scaffold(
      body: Center(child: _listPage[_selectTabIndex]),
      bottomNavigationBar: _bottomNavBar,
    );
  }
}
