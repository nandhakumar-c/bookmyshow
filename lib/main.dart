import 'package:flutter/material.dart';
import 'loginpage/loginpage.dart';
import 'landingpage/scrollables.dart';

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
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyApp());
  }
}
