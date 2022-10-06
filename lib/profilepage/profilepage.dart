import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../loginpagevalidation/google_sign_in_cubit.dart';

class CardDetails {
  String? text = "";
  String? description = "";
  final icon;
  CardDetails({this.text, this.description, this.icon});
}

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

List<CardDetails> cards = [
  CardDetails(
      text: 'Your orders',
      description: 'View all your bookings & purchase',
      icon: Icons.shopping_bag_outlined),
  CardDetails(
      text: 'Stream Library',
      description: 'View all your bookings & purchase',
      icon: Icons.library_add_outlined),
  CardDetails(
      text: 'Help & Support',
      // description: 'View all your bookings & purchase',
      icon: Icons.support_outlined),
  CardDetails(
      text: 'Discount Store',
      description: 'View all your bookings & purchase',
      icon: Icons.discount_outlined),
  CardDetails(
      text: 'Accounts & Settings',
      //description: 'View all your bookings & purchase',
      icon: Icons.settings_outlined)
];

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
                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: cards.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CardGenerator(cards[index]);
                    });
              }
            }));
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

class CardGenerator extends StatelessWidget {
  CardDetails? card;
  CardGenerator(this.card);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(1),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 13.5,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Icon(card?.icon),
              SizedBox(
                width: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (card?.description != null) ...[
                    Text('${card?.text}'),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      '${card?.description}',
                      style: TextStyle(fontSize: 10, color: Colors.grey[700]),
                    )
                  ],
                  if (card?.description == null)
                    Center(child: Text('${card?.text}')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
