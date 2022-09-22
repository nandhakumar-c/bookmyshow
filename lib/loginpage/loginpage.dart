import 'package:bookmyshow/bottomnavigation/bottomnavigator.dart';
import 'package:bookmyshow/loginpage/frontscrollable.dart';
import 'package:bookmyshow/loginpage/mobilelogin.dart';
import 'package:bookmyshow/loginpagevalidation/emailvalidation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../landingpage/landingpage.dart' as page;

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: UserInterface());
    ;
  }
}

class UserInterface extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UserInterfaceState();
  }
}

class UserInterfaceState extends State<UserInterface> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  bool hidden = true;
  void isTapped() {
    setState(() {
      hidden = !hidden;
    });
  }

  void validate() {
    if (formkey.currentState!.validate()) {
      print('Validated');
    } else {
      print('Not validated');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const BottomNavigation()));
                    },
                    child: const Text(
                      "SKIP",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    )),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: Container(
                height: 175,
                child: const FrontScrollables(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(
                      color: Color.fromARGB(255, 48, 45, 45),
                    ),
                  ),
                ),
                onPressed: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => EmailValidator()));
                  GoogleSignIn().signIn();
                },
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: Row(
                      children: const [
                        Image(
                            alignment: Alignment.centerLeft,
                            image: AssetImage("assets/icons/Google.png"),
                            height: 17,
                            width: 17),
                        Center(
                          widthFactor: 1.75,
                          child: Text(
                            "Continue with Google",
                            style: TextStyle(fontSize: 17, color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: TextButton(
                onPressed: () {},
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.email_outlined,
                          color: Colors.black87,
                          size: 20,
                        ),
                        const Center(
                          widthFactor: 1.85,
                          child: Text(
                            "Continue with Email",
                            style: TextStyle(fontSize: 17, color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Text(
              "OR",
              style: const TextStyle(color: Color.fromARGB(255, 109, 107, 107)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: TextFormField(
                enableInteractiveSelection: false,
                focusNode: new AlwaysDisabledFocusNode(),
                readOnly: true,
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MobileLogin())),
                decoration: const InputDecoration(
                    label: Text('Continue with phone number')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
