import 'package:flutter/material.dart';

class SeatingPage extends StatefulWidget {
  String? theatreName;
  String? movieName;
  SeatingPage({this.theatreName, this.movieName});

  @override
  State<SeatingPage> createState() => _SeatingPageState();
}

class _SeatingPageState extends State<SeatingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movieName.toString()),
        backgroundColor: Color.fromARGB(255, 6, 20, 32),
      ),
    );
  }
}
