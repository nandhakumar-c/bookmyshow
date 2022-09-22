import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailValidator extends StatefulWidget {
  const EmailValidator({Key? key}) : super(key: key);

  @override
  State<EmailValidator> createState() => _EmailValidatorState();
}

class _EmailValidatorState extends State<EmailValidator> {
  @override
  Widget build(BuildContext context) {
    double? height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(title: Text("Email Login")),
        body: Container(
            child: Container(
          padding: EdgeInsets.only(top: 10),
          child: Row(
            children: [
              Row(
                children: [
                  Text(
                    "Continue with ",
                    style: TextStyle(
                      fontFamily: 'Product Sans',
                      fontSize: MediaQuery.of(context).size.height / 40,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Image.asset(
                      'assets/images/google.png',
                      scale: MediaQuery.of(context).size.height / 20,
                    ),
                  )
                ],
              )
            ],
          ),
        )));
  }
}
