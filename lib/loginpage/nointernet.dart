import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:bookmyshow/widgets/dynamicsize.dart';

class NoInternet extends StatefulWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  State<NoInternet> createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Lottie.asset('assets/lottie/noCatInternet.json',
            width: ScreenSize().width, height: ScreenSize().height),
      ),
    );
  }
}
