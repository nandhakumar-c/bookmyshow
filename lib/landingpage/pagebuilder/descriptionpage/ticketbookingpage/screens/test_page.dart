import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TestPage extends StatefulWidget {
  final data;
  TestPage(this.data);
  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: StreamBuilder(
        //   stream: data,
        //   builder: (context, snapshot) {},
        // ),
        );
  }
}
