import 'package:flutter/material.dart';
import './landingpage.dart' as page;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("User Login Page")), body: UserInterface());
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
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.topCenter,
              child: Text(
                "CODING MART",
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 25,
                  fontFamily: 'BeVietnamPro',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 25),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 5),
                    child: Row(
                      children: [Icon(Icons.person)],
                    ),
                  ),
                  Text(
                    "Username ",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15),
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter username',
                    hintText: 'Username'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 25),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 5),
                    child: Row(
                      children: [Icon(Icons.security)],
                    ),
                  ),
                  Text(
                    "Password",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15),
              child: TextFormField(
                obscureText: hidden,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your password',
                  hintText: 'Password',
                  suffixIcon: InkWell(
                    onTap: isTapped,
                    child:
                        Icon(hidden ? Icons.visibility : Icons.visibility_off),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return '* Required';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15),
              child: ElevatedButton(
                child: Text("Login"),
                onPressed: () {
                  // final isValidForm = formkey.currentState!.validate();
                  // if (isValidForm) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => page.LandingPage(),
                  ));
                  //}
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
