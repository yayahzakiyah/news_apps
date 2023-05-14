import 'package:flutter/material.dart';
import 'package:news_app/pages/navigation/bottom_navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Template Flutter',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: const BottomNavigationCustom(),
    );
  }
}
