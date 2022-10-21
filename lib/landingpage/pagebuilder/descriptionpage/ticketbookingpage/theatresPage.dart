import 'package:bookmyshow/landingpage/pagebuilder/descriptionpage/ticketbookingpage/theatrePageBuilder/theatreList.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TheatresPage extends StatefulWidget {
  final String? movieName;
  // ignore: use_key_in_widget_constructors
  const TheatresPage(this.movieName);

  @override
  State<TheatresPage> createState() => _TheatresPageState();
}

class _TheatresPageState extends State<TheatresPage> {
  List<Map<String, Object>> get dateAndMonthList {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().add(Duration(days: index));
      return ({
        'date': DateFormat.d().format(weekDay),
        'month': DateFormat('MMM').format(weekDay),
        'day': DateFormat.E().format(weekDay).substring(0, 3)
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          //actions: [],
          leading: IconButton(
              icon: const Icon(Icons.chevron_left),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          backgroundColor: const Color.fromARGB(255, 10, 21, 46),
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
              ...dateAndMonthList
                  .map(
                    (data) => dateAndTimeCardGenerator(data, h, w),
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

  dateAndTimeCardGenerator(Map<String, Object> e, double h, double w) {
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
                Text("${e['day'].toString().toUpperCase()}"),
                Text(
                  e['date'].toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(e['month'].toString().toUpperCase())
              ]),
        ),
      ),
    );
  }
}
