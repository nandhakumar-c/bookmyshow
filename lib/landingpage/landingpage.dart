import 'dart:developer';

import 'package:bookmyshow/bottomnavigation/bottomnavigator.dart';
import 'package:bookmyshow/landingpage/pagebuilder/trendingtvshows.dart';
import 'package:bookmyshow/landingpage/pagebuilder/trending.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

class LandingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LandingPageState();
  }
}

double? h, w, size;

class LandingPageState extends State<LandingPage> {
  List? trendingMovies = [];
  List? tv = [];
  List? topRatedMovies = [];
  final String apikey = '4d787d53b25af3a115347b6db2063faa';
  final readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0ZDc4N2Q1M2IyNWFmM2ExMTUzNDdiNmRiMjA2M2ZhYSIsInN1YiI6IjYzMjA1ODQ4Y2U5ZTkxMDA3Zjc1ZWRlYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.-SzjQqBNJ2trYEMfcKXP0tH0VB8HRY2kVAhP9fGIZ4Q';
  @override
  void initState() {
    // TODO: implement initState
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readAccessToken),
      logConfig: ConfigLogger(showLogs: true, showErrorLogs: true),
    );

    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResults = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getAiringToday();

    setState(() {
      trendingMovies = trendingResult['results'];
      topRatedMovies = topRatedResults['results'];
      tv = tvresult['results'];
    });
    print(tvresult);
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height * 0.23;
    w = MediaQuery.of(context).size.width * 0.25;
    //size = MediaQuery.of(context).size;

    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                iconSize: 27),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_none_outlined),
              iconSize: 27,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.qr_code),
              iconSize: 27,
            ),
          ],
          backgroundColor: Color.fromARGB(255, 10, 21, 46),
          title: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                child: Text(
                  "It All Starts Here",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "Coimbatore",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          )),
        ),
        body: ListView(
          padding: EdgeInsets.all(h! / 25),
          children: [
            TrendingMovies(
              titleText: 'Recommended Movies',
              trendingMovies: trendingMovies,
            ),
            TrendingMovies(
              titleText: 'Top Rated Movies',
              trendingMovies: topRatedMovies,
            ),
            TrendingTvShows(
              titleText: 'TV Shows',
              trendingShows: tv,
            )
          ],
        ),
      ),
    );
  }
}
