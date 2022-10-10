import 'package:flutter/material.dart';

class SeeAllPage extends StatefulWidget {
  const SeeAllPage({Key? key}) : super(key: key);

  @override
  State<SeeAllPage> createState() => _SeeAllPageState();
}

class _SeeAllPageState extends State<SeeAllPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 10, 21, 46),
          title: Text(
            "Now Showing",
            style: TextStyle(color: Colors.white),
          )),
      body: Text("Genres"),
    );
  }
}
