import 'package:bookmyshow/provider/theatreseat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TheatreSeatScreen extends StatefulWidget {
  const TheatreSeatScreen({Key? key}) : super(key: key);

  @override
  State<TheatreSeatScreen> createState() => _TheatreSeatScreenState();
}

class _TheatreSeatScreenState extends State<TheatreSeatScreen> {
  @override
  Widget build(BuildContext context) {
    final seats_provider = Provider.of<TheatreSeatsList>(context);
    return Scaffold(
        appBar: AppBar(title: Text("TheatreSeatScreen")),
        body: InteractiveViewer(child: Column(children: ,)));
  }
}
