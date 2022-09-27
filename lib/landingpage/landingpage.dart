import 'package:get/get.dart';
import 'package:bookmyshow/LocaleString.dart';
import 'package:bookmyshow/bottomnavigation/bottomnavigator.dart';
import 'package:bookmyshow/landingpage/pagebuilder/trendingtvshows.dart';
import 'package:bookmyshow/landingpage/pagebuilder/trending.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    //print(tvresult);
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height * 0.23;
    w = MediaQuery.of(context).size.width * 0.25;
    //size = MediaQuery.of(context).size;
    List<String> items = ['English', 'Tamil', 'Hindi'];
    String? selectedItem = 'English';
    Map<String, List<String>> langList = {
      'English': ['en', 'US'],
      'Tamil': ['ta', 'US'],
      'Hindi': ['hi', 'IN']
    };
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
                  "It All Starts Here".tr,
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
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 226, 217, 217),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Choose Your Language",
                      style: GoogleFonts.dmSans(
                          fontSize: 18,
                          color: Color.fromARGB(255, 1, 8, 44),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 75,
                    width: 250,
                    child: SizedBox(
                        width: 240,
                        child: DropdownButtonFormField<String>(
                          focusColor: Colors.white,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                    BorderSide(width: 3, color: Colors.blue)),
                          ),
                          value: selectedItem,
                          items: items
                              .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: TextStyle(fontSize: 15),
                                  )))
                              .toList(),
                          onChanged: ((value) => setState(() {
                                selectedItem = value;
                                var locale = Locale(langList[value]![0],
                                    langList[value]![1].toString());
                                Get.updateLocale(locale);
                              })),
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TrendingMovies(
              titleText: 'recommended movies'.tr,
              trendingMovies: trendingMovies,
            ),
            TrendingMovies(
              titleText: 'top rated movies'.tr,
              trendingMovies: topRatedMovies,
            ),
            TrendingTvShows(
              titleText: 'tv shows'.tr,
              trendingShows: tv,
            ),
            ElevatedButton(
                onPressed: () {
                  var locale = Locale('ta', 'IN');
                  Get.updateLocale(locale);
                },
                child: Text("Change Language")),
            ElevatedButton(
                onPressed: () {
                  var locale = Locale('en', 'US');
                  Get.updateLocale(locale);
                },
                child: Text("Revert Change"))
          ],
        ),
      ),
    );
  }
}
