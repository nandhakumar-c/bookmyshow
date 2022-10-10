import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SeeAllPage extends StatefulWidget {
  List<dynamic>? trendingList;
  SeeAllPage({this.trendingList});

  @override
  State<SeeAllPage> createState() => _SeeAllPageState();
}

class _SeeAllPageState extends State<SeeAllPage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    int index = 0;
    void stateSet() {
      setState(() {
        index = index + 1;
      });
    }

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 10, 21, 46),
          title: Text(
            "Now Showing",
            style: TextStyle(color: Colors.white),
          )),
      body: GridView.count(crossAxisCount: 2, children: [
        ...widget.trendingList!.map(
          (singleList) {
            stateSet();
            return CardBuilder(h, w, singleList, index);
          },
        ).toList()
      ]),
    );
  }

  CardBuilder(double h, double w, List trendingList, int index) {
    return Container(
      //width: w / 2.8,
      margin: EdgeInsets.only(right: h * 0.01),
      child: Column(
        children: [
          Container(
              height: h * 0.26,
              width: w * 0.33,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image(
                    fit: BoxFit.cover,
                    image: NetworkImage('https://image.tmdb.org/t/p/w500/' +
                        trendingList[index]['poster_path'])),
              )),
          SizedBox(
            height: h * 0.008,
          ),
          Container(
              width: w * 0.32,
              child: Text(
                  trendingList![index]['title'] != null
                      ? trendingList![index]['title']
                      : "Loading",
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w400,
                    fontSize: MediaQuery.of(context).size.height * 0.015,
                  ))),
        ],
      ),
    );
  }
}
