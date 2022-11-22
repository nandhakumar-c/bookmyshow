import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  final Animation<double>? transitionAnimation;
  const UserProfileScreen({this.transitionAnimation, super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.transitionAnimation!,
      builder: (context, child) {
        return SlideTransition(
          position:
              Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0)).animate(
            CurvedAnimation(
                parent: widget.transitionAnimation!, curve: Curves.easeInOut),
          ),
          child: child,
        );
      },
      child: Scaffold(
        appBar: AppBar(title: const Text("Edit Profile")),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text("Mobile Number"),
                ],
              ),
              TextFormField(),
              TextFormField(),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {},
            child: Text("Save Changes"),
          ),
        )),
      ),
    );
  }
}
