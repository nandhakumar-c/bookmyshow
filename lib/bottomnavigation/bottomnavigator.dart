import 'package:bookmyshow/buzzpage/buzzpage.dart';
import 'package:bookmyshow/landingpage/landingpage.dart';
import 'package:bookmyshow/profilepage/profilepage.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return BottomNavigationState();
  }
}

class BottomNavigationState extends State<BottomNavigation> {
  int currentIndex = 0;
  final screens = [
    LandingPage(),
    BuzzPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.speaker),
            label: 'Buzz',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
