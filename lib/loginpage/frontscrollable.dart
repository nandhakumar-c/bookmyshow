import 'package:flutter/material.dart';

class FrontList {
  FrontList({this.text, this.poster});
  final String? text;
  final String? poster;
}

class FrontScrollables extends StatefulWidget {
  const FrontScrollables({Key? key}) : super(key: key);

  @override
  State<FrontScrollables> createState() => _FrontScrollablesState();
}

class _FrontScrollablesState extends State<FrontScrollables> {
  List frontScrollList = [
    FrontList(
        poster: 'assets/icons/Tickets.png',
        text:
            'Enjoy faster show booking through our recommendations tailored for you'),
    FrontList(
        poster: 'assets/icons/popcorn.jpg',
        text:
            'Forgot to grab your movie snacks? No worries! you can still order them even after booking your tickets'),
    FrontList(
        poster: 'assets/icons/discountedTicket.png',
        text:
            'Now save money on your movie tickets with free discount Coupons from Restaurants and Cafes')
  ];

  Widget cardCreator(value) {
    return Container(
      padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
      child: SizedBox(
        width: 250,
        child: Column(
          children: [
            Image(
              image: AssetImage(value.poster),
              height: 75,
              width: 75,
              fit: BoxFit.fitHeight,
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              // padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: Text(
                value.text,
                style: TextStyle(
                    fontSize: 10,
                    color: const Color.fromRGBO(158, 158, 158, 1)),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.clip,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> movieListBuilder() {
    return frontScrollList.map((e) => cardCreator(e)).toList();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: movieListBuilder(),
    );
  }
}
