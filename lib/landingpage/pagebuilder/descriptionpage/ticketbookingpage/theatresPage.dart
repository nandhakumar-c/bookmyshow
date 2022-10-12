import 'package:flutter/material.dart';

class TheatresPage extends StatefulWidget {
  String? movieName;
  TheatresPage(this.movieName);

  @override
  State<TheatresPage> createState() => _TheatresPageState();
}

class _TheatresPageState extends State<TheatresPage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
            actions: [],
            leading: IconButton(
                icon: Icon(Icons.chevron_left),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            backgroundColor: Color.fromARGB(255, 10, 21, 46),
            title: Text(
              widget.movieName.toString(),
              style: TextStyle(fontSize: w * 0.04),
            )),
        body: ListView(
          children: [],
        ));
  }
}
