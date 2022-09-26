import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfilePage extends StatefulWidget {
  Rx<GoogleSignInAccount?>? data;
  ProfilePage({Key? key, this.data}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState(data);
}

class _ProfilePageState extends State<ProfilePage> {
  Rx<GoogleSignInAccount?>? data;
  _ProfilePageState(this.data);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 10, 21, 46),
          title: Column(
            children: [
              Text(
                "Hey!",
                style: TextStyle(color: Colors.white),
              )
            ],
          )),
    );
  }
}
