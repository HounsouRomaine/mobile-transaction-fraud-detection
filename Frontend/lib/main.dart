import 'package:flutter/material.dart';
import 'theme.dart';
import 'ecrans/dashboard.dart';
import 'ecrans/analyse.dart';
import 'ecrans/historique.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;

  final pages = [
    Dashboard(),
    Analyse(),
    Historique(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Dashboard"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Analyse"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "Historique"),
        ],
      ),
    );
  }
}