import 'dart:async';
import 'package:bookmyshow/bottomnavigation/bottomnavigator.dart';
import 'package:bookmyshow/loginpage/nointernet.dart';
import 'package:bookmyshow/widgets/testing.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lottie/lottie.dart';
import '/loginpage/loginpage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late StreamSubscription subscription;
  var hasInternet = false;
  bool isAlertSet = false;

  @override
  void initState() {
    // getConnectivity();
    super.initState();
    InternetConnectionChecker().onStatusChange.listen((status) {
      final hasInternet = status == InternetConnectionStatus.connected;
      setState(() {
        this.hasInternet = hasInternet;
        if (hasInternet) {
          Timer(
              Duration(seconds: 3),
              () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => MyApp())));
        } else {
          Timer(
              Duration(seconds: 3),
              () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => NoInternet())));
        }
      });
    });
  }

  // @override
  // void dispose() {
  //   subscription.cancel();
  //   super.dispose();
  // }

  getConnectivity() => subscription = Connectivity()
          .onConnectivityChanged
          .listen((ConnectivityResult result) async {
        hasInternet = await InternetConnectionChecker().hasConnection;
        if (!hasInternet && isAlertSet == false) {
          setState(() {
            isAlertSet = true;
          });
        }
      });

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

            Container(
                width: MediaQuery.of(context).size.width / 2.8,
                height: MediaQuery.of(context).size.height / 6.0,
                child: IntrinsicHeight(
                  child: Lottie.asset(
                    'assets/lottie/dotLoader.json',
                  ),
                )),

            // SpinKitRing(
            //   size: 35,
            //   lineWidth: 3,
            //   color: Colors.grey,
            // ),
          ],
        ),
      ),
    );
  }
}
