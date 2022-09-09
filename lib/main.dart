import 'package:flutter/material.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
import './scrollables.dart';

void main() => runApp(BookMyShow());

class BookMyShow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BookMyShowState();
  }
}

double? h, w, size;

class BookMyShowState extends State<BookMyShow> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StateChild(),
    );
  }
}

class StateChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height * 0.2;
    w = MediaQuery.of(context).size.width * 0.25;
    //size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              iconSize: 27),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none_outlined),
            iconSize: 27,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.qr_code),
            iconSize: 27,
          ),
        ],
        backgroundColor: Color.fromARGB(255, 10, 21, 46),
        title: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              child: Text(
                "It All Starts Here",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "Coimbatore",
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        )),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Recommended Movies",
              style: TextStyle(
                // fontFamily: 'RobotoCondensed',
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
            ElevatedButton(
              onPressed: () {},
              child: Text("Click"),
              style: ElevatedButton.styleFrom(primary: Colors.orange),
            )
          ],
        ),
      ),
    );
  }
}
