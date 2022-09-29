import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../cubit/google_sign_in/cubit/google_sign_in_cubit.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
        body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData) {
                return signedInScreen(context);
              } else if (snapshot.hasError)
                return Center(child: Text("Oops ! Something went wrong"));
              else {
                return Center(
                  child: Text("Nothing"),
                );
              }
            }));
  }

  Card cardGenerator(String text) {
    return Card(
      child: Text(""),
    );
  }

  Container signedInScreen(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                    "Hello , :${FirebaseAuth.instance.currentUser!.displayName}"),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      final provider = BlocProvider.of<GoogleSignInCubit>(
                          context,
                          listen: false);
                      provider.signOutWithGoogle();
                      FirebaseAuth.instance.signOut();
                    },
                    child: Text("Log out")),
              ])),
        ],
      ),
    );
  }
}
