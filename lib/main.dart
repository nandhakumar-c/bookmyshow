import 'package:flutter/material.dart';
import './scrollables.dart';

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
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red[800],
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
          ],
          backgroundColor: Color.fromARGB(255, 243, 243, 243),
          title: Container(
            child: Image(
              image: AssetImage('assets/icons/PngItem_1896899.png'),
              width: 90,
              height: 90,
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                "Recommended Movies",
                style: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Container(
                  height: 175,
                  child: ScrollableWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
