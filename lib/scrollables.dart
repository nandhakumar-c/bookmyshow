import 'package:flutter/material.dart';

class MoviesList {
  MoviesList({this.movie, this.poster});
  final String? movie;
  final String? poster;
}

class ScrollableWidget extends StatelessWidget {
  List movieList = [
    MoviesList(movie: 'Brahmastra', poster: 'assets/images/Brahmastra.jpg'),
    MoviesList(movie: 'Cobra', poster: 'assets/images/Cobra.jpg'),
    MoviesList(
        movie: 'Thiruchitrambalam',
        poster: 'assets/images/thiruchitrambalam2.jpg'),
    MoviesList(movie: 'Sita Ramam', poster: 'assets/images/Sitaramam.jpg'),
  ];

  Widget cardCreator(value) {
    return Card(
      color: Colors.yellow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(children: [
        Container(
          width: 100,
          height: 145,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(value.poster),
            ),
          ),
        ),
        SizedBox(
          height: 2.5,
        ),
        Text(
          value.movie,
          style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            color: Colors.black,
            fontSize: 13,
          ),
        ),
      ]),
    );
  }

  List<Widget> movieListBuilder() {
    return movieList.map((e) => cardCreator(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: movieListBuilder(),
    );
  }
}
