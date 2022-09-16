import 'package:bookmyshow/loginpage/splashscreen.dart';
import 'package:bookmyshow/widgets/testing.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
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
  Widget build(BuildContext context) => OverlaySupport.global(
        child: MaterialApp(
            debugShowCheckedModeBanner: false, home: SplashScreen()),
      );
}
