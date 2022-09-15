import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launchon;

  const Description(
      {super.key,
      required this.name,
      required this.description,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.launchon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: ListView(children: [
        Container(
          height: MediaQuery.of(context).size.height / 3.2,
          child: Stack(children: [
            Positioned(
              child: Container(
                  height: MediaQuery.of(context).size.height / 3.2,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    bannerurl,
                    fit: BoxFit.cover,
                  )),
            ),
            Positioned(
              bottom: 15,
              child: Container(
                margin: EdgeInsets.only(left: 10),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Text(
                  " ❤️ Average Rating : " + vote,
                  style: GoogleFonts.roboto(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ),
          ]),
        )
      ]),
    ));
  }
}
