import 'package:bookmyshow/landingpage/pagebuilder/descriptionpage/ticketbookingpage/theatrePageBuilder/theatreList.dart';
import 'package:flutter/material.dart';

class Dates {
  String? day;
  String? date;
  String? month;
  Dates({this.date, this.day, this.month});
}

List<Dates> datesAndDayList = [
  Dates(day: "MON", date: "17", month: "OCT"),
  Dates(day: "TUE", date: "18", month: "OCT"),
  Dates(day: "WED", date: "19", month: "OCT"),
  Dates(day: "THU", date: "20", month: "OCT"),
  Dates(day: "FRI", date: "21", month: "OCT"),
  Dates(day: "SAT", date: "22", month: "OCT"),
  Dates(day: "SUN", date: "23", month: "OCT"),
];

class TheatresPage extends StatefulWidget {
  String? movieName;
  TheatresPage(this.movieName);

  @override
  State<TheatresPage> createState() => _TheatresPageState();
}

class _TheatresPageState extends State<TheatresPage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          actions: [],
          leading: IconButton(
              icon: Icon(Icons.chevron_left),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          backgroundColor: Color.fromARGB(255, 10, 21, 46),
          title: Text(
            widget.movieName.toString(),
            style: TextStyle(fontSize: w * 0.04),
          )),
      body: Column(children: [
        Container(
          color: Colors.white,
          child: SizedBox(
            height: h * 0.01,
          ),
        ),
        Container(
          color: Colors.white,
          height: h * 0.10,
          child: Row(
            children: [
              ...datesAndDayList
                  .map(
                    (e) => dateAndTimeCardGenerator(e, h, w),
                  )
                  .toList(),
            ],
          ),
        ),
        SizedBox(
          height: h * 0.003,
        ),
        Container(
          height: h * 0.057,
          width: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.only(left: w * 0.03),
          child: Row(
            children: [
              Text(
                "English",
                style:
                    TextStyle(fontWeight: FontWeight.w600, fontSize: w * 0.03),
              ),
              SizedBox(width: w * 0.02),
              Icon(
                Icons.circle,
                size: w * 0.01,
              ),
              SizedBox(width: w * 0.02),
              Text(
                "2D",
                style:
                    TextStyle(fontWeight: FontWeight.w600, fontSize: w * 0.03),
              ),
            ],
          ),
        ),
        Flexible(
            child: TheatreLists(
          movieName: widget.movieName,
        )),
      ]),
      backgroundColor: Colors.grey[350],
    );
  }

  dateAndTimeCardGenerator(Dates e, double h, double w) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => TheatresPage(widget.movieName),
        ));
      },
      child: Container(
        color: Colors.white,
        height: h * 0.1,
        width: w * 0.14,
        child: Padding(
          padding: EdgeInsets.all(w * 0.02),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(e.day.toString()),
                Text(
                  e.date.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(e.month.toString())
              ]),
        ),
      ),
    );
  }
}
