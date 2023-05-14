import 'package:flutter/material.dart';
import 'package:news_app/pages/home/homepage.dart';

class BottomNavigationCustom extends StatefulWidget {
  const BottomNavigationCustom({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomNavigationCustom();
}

class _BottomNavigationCustom extends State<BottomNavigationCustom> {
  int _currentTabIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: <Widget>[
        const HomePage(),
        const HomePage(),
        const HomePage(),
      ][_currentTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: 'Home'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.explore_rounded), label: 'Explore'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_rounded), label: 'Bookmark'),
        ],
        currentIndex: _currentTabIndex,
        onTap: onTabTapped,
      ),
    );
  }
}
