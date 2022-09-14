import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

class MoviesList extends StatefulWidget {
  const MoviesList({Key? key}) : super(key: key);

  @override
  State<MoviesList> createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  List trendingMovies = [];
  List tv = [];
  List topRatedMovies = [];
  final String apikey = '4d787d53b25af3a115347b6db2063faa';
  final readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0ZDc4N2Q1M2IyNWFmM2ExMTUzNDdiNmRiMjA2M2ZhYSIsInN1YiI6IjYzMjA1ODQ4Y2U5ZTkxMDA3Zjc1ZWRlYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.-SzjQqBNJ2trYEMfcKXP0tH0VB8HRY2kVAhP9fGIZ4Q';

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readAccessToken),
      logConfig: ConfigLogger(showLogs: true, showErrorLogs: true),
    );

    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResults = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPopular();
    setState(() {
      trendingMovies = trendingResult['results'];
      topRatedMovies = topRatedResults['results'];
      tv = tvresult['result'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      child: ListView.builder(
          itemCount: trendingMovies.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
              child: Container(
                  width: 140,
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500/' +
                                    trendingMovies[index]['poster_path']),
                          ),
                        ),
                      ),
                      Container(
                          child: Text(
                        trendingMovies[index]['title'] != null
                            ? trendingMovies[index]['title']
                            : "Loading",
                        style: TextStyle(fontSize: 20),
                      )),
                    ],
                  )),
            );
          }),
    );
  }
}
