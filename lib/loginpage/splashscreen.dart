import 'dart:async';
import 'package:flutter/material.dart';
import '/loginpage/loginpage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyApp())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/icons/PngItem_1896899.png'),
              width: 150,
              fit: BoxFit.contain,
            ),
            Text(
              'It All Starts Here',
              style: TextStyle(
                color: Color.fromARGB(255, 97, 89, 89),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            SpinKitRing(
              size: 35,
              lineWidth: 3,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
