import 'package:flutter/material.dart';

class BuzzPage extends StatelessWidget {
  const BuzzPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 10, 21, 46),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "BUZZ",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 175,
              ),
              Text(
                "Discover what's trending in entertainment",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 75),
              )
            ],
          )),
    );
  }
}
