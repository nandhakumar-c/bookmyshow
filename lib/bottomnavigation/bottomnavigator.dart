import 'package:bookmyshow/buzzpage/buzzpage.dart';
import 'package:bookmyshow/landingpage/landingpage.dart';
import 'package:bookmyshow/profilepage/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class BottomNavigation extends StatefulWidget {
  Rx<GoogleSignInAccount?>? data;
  //BottomNavigation({Key? key, this.data}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return BottomNavigationState();
  }
}

class BottomNavigationState extends State<BottomNavigation> {
  Rx<GoogleSignInAccount?>? data1;
  //BottomNavigationState({this.data1});
  int currentIndex = 0;
  final screens = [
    LandingPage(),
    BuzzPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/BookMyShowLogo-modified.png'),
            ),
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
