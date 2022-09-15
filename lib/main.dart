import 'package:bookmyshow/loginpage/splashscreen.dart';
import 'package:flutter/material.dart';
import 'loginpage/loginpage.dart';

void main() => runApp(BookMyShow());

class BookMyShow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BookMyShowState();
  }
}

class BookMyShowState extends State<BookMyShow> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
