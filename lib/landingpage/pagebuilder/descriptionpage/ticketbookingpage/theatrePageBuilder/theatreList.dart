import 'package:flutter/material.dart';

class TheatreList {
  String? theatreName;
  String? Offers = "";
  bool? cancellation_available = false;
  TheatreList({this.theatreName, this.Offers, this.cancellation_available});
}

List timeList = [
  ["10:30 AM", "02:30 PM", "06:30 PM", "10:00 PM"],
  ["11:10 AM", "11:30 AM", "02:50 PM", '03:10 PM', '06:25 PM', '06:45 PM'],
  ["10:30 AM", "02:30 PM", "06:30 PM", "10:00 PM", '10:20 PM'],
  [
    "10:30 AM",
    "02:30 PM",
    "06:30 PM",
  ],
];

List<TheatreList> theatreLists = [
  TheatreList(
      theatreName: "Murugan Cinemas A/C 4K Atmos: Thudiyalur",
      Offers: "5% off for Superstars | Use code: STAR5"),
  TheatreList(
      theatreName: "SPI: The Cinema, Brookefields Mall",
      cancellation_available: true),
  TheatreList(theatreName: "Karpagam Theatres 4K Dolby Atmos: Coimbatore"),
  TheatreList(
      theatreName: "SPI: The Cinema, Brookefields Mall",
      cancellation_available: true),
];

class TheatreLists extends StatefulWidget {
  const TheatreLists({Key? key}) : super(key: key);

  @override
  State<TheatreLists> createState() => _TheatreListState();
}

class _TheatreListState extends State<TheatreLists> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      //color: Colors.blue,
      padding: EdgeInsets.all(w * 0.03),
      child: ListView.builder(
        itemCount: theatreLists.length,
        itemBuilder: (context, index) {
          return theatreCardGenerator(
              theatreLists[index], timeList[index], h, w);
        },
      ),
    );
  }

  Widget theatreCardGenerator(
      TheatreList theatreList, List timeList, double h, double w) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(w * 0.03),
      height: h * 0.3,
      width: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        theatreList.theatreName.toString().length <= 70
            ? Container(
                height: h * 0.05,
                width: w * 0.9,
                child: Row(
                  children: [
                    Icon(
                      Icons.favorite_border_outlined,
                      size: w * 0.04,
                    ),
                    SizedBox(
                      width: w * 0.02,
                    ),
                    Container(
                      height: h * 0.02,
                      width: w * 0.75,
                      child: Text(
                        theatreList.theatreName.toString(),
                        maxLines: 2,
                        softWrap: true,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.black87),
                      ),
                    )
                  ],
                ),
              )
            : Container(
                height: h * 0.225,
                child: Row(
                  children: [
                    Icon(
                      Icons.favorite_border_outlined,
                      size: w * 0.04,
                    ),
                    SizedBox(
                      width: w * 0.02,
                    ),
                    Container(
                      height: h * 0.1,
                      width: w * 0.75,
                      child: Text(
                        theatreList.theatreName.toString(),
                        maxLines: 2,
                        softWrap: true,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.black87),
                      ),
                    )
                  ],
                ),
              ),
        SizedBox(
          height: h * 0.01,
        ),
        theatreList.cancellation_available == true
            ? Text(
                "Cancellation Available",
                style: TextStyle(fontSize: w * 0.03),
              )
            : Text(""),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 120,
          child: GridView.count(
            physics: ScrollPhysics(),
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            childAspectRatio: 2,
            mainAxisSpacing: 10,

            //shrinkWrap: true,
            children: [
              ...timeList
                  .map(
                    (e) => OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        e,
                        style: TextStyle(
                            fontSize: w * 0.035, fontWeight: FontWeight.bold),
                      ),
                      style: OutlinedButton.styleFrom(
                        primary: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(w * 0.02)),
                        side: BorderSide(
                          color: Colors.black54,
                          width: 1,
                        ),
                      ),
                    ),
                  )
                  .toList()
            ],
          ),
        )
      ]),
    );
  }
}
