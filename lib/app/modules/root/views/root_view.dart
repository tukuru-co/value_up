import 'package:flutter/material.dart';
import 'package:value_up/app/modules/auth/views/login1.dart';
import 'package:value_up/app/modules/home/views/home.dart';

class RootView extends StatefulWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<RootView> {
  int _selectedScreenIndex = 0;
  final List _screens = [
    {"screen": HomeView(), "title": "Home"},
    {"screen": LoginView(), "title": "Store "},
    {"screen": Container(), "title": "Star"},
    {"screen": Container(), "title": "Setting"}
  ];

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedScreenIndex]["screen"],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedScreenIndex,
        onTap: _selectScreen,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              label: 'Screen A'),
          BottomNavigationBarItem(
              icon: Icon(Icons.storefront_outlined, color: Colors.black),
              label: "Screen B"),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_border_outlined, color: Colors.black),
              label: "Screen B"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.black), label: "Screen B")
        ],
      ),
    );
  }
}
