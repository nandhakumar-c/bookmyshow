import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfilePage extends StatefulWidget {
  Rx<GoogleSignInAccount?>? data;
  // ProfilePage({Key? key, this.data}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<String> items = ['English', 'Tamil', 'Hindi'];
  String? selectedItem = 'English';
  Rx<GoogleSignInAccount?>? data;
  // _ProfilePageState(this.data);
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
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Text("Choose Language"),
              SizedBox(
                width: 240,
                child: Center(
                    child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(width: 3, color: Colors.blue)),
                  ),
                  value: selectedItem,
                  items: items
                      .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                            style: TextStyle(fontSize: 20),
                          )))
                      .toList(),
                  onChanged: ((value) => setState(() {
                        selectedItem = value;
                      })),
                )),
              ),
            ],
          ),
        ));
  }
}
