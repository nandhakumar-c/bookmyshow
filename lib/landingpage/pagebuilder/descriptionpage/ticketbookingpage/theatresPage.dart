import 'package:bookmyshow/landingpage/pagebuilder/descriptionpage/ticketbookingpage/theatrePageBuilder/theatreList.dart';
import 'package:flutter/material.dart';

class Dates {
  String? day;
  String? date;
  String? month;
  Dates({this.date, this.day, this.month});
}

List datesAndDayList = [
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
          height: h * 0.10,
          child: Row(
            children: [
              // Expanded(
              //     child: ListView.separated(
              //   scrollDirection: Axis.horizontal,
              //   itemCount: 7,
              //   separatorBuilder: (context, index) => SizedBox(width: 20),
              //   itemBuilder: (context, index) => Card(
              //     child: Text("69"),
              //   ),
              // ))
            ],
          ),
        ),
        Flexible(child: TheatreLists()),
      ]),
      backgroundColor: Colors.grey[350],
    );
  }
}
