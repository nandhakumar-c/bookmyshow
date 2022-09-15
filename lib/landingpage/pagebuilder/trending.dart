import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrendingMovies extends StatelessWidget {
  List? trendingMovies;
  String? titleText;
  TrendingMovies({Key? key, this.trendingMovies, this.titleText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double h = (MediaQuery.of(context).size.height);
    double w = (MediaQuery.of(context).size.width);

    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          titleText!,
          style: TextStyle(
            // fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.w500,
            fontSize: MediaQuery.of(context).size.height / 45,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: h / 2.9,
          child: ListView.builder(
              itemCount: trendingMovies?.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                      width: w / 2.8,
                      margin: EdgeInsets.all(h / 300),
                      child: Column(
                        children: [
                          Container(
                            height: h / 3.685,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500/' +
                                        trendingMovies![index]['poster_path']),
                              ),
                            ),
                          ),
                          Container(
                              child: Text(
                                  trendingMovies![index]['title'] != null
                                      ? trendingMovies![index]['title']
                                      : "Loading",
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                    fontSize:
                                        MediaQuery.of(context).size.height / 60,
                                  ))),
                        ],
                      )),
                );
              }),
        )
      ]),
    );
  }
}