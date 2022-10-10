import 'package:bookmyshow/landingpage/landingpage.dart';
import 'package:bookmyshow/loginpage/loginpage.dart';
import 'package:bookmyshow/profilepage/profilepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../bottomnavigation/bottomnavigator.dart';

var num = 0;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData) {
                num = 1;
                return BottomNavigation();
              } else if (snapshot.hasError)
                return Center(child: Text("Oops ! Something went wrong"));
              else {
                num = 0;
                return MyApp();
              }
            }));
  }
}
