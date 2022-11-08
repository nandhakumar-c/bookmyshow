import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../provider/theatrelist_provider.dart';
import '../../../../../../provider/date_provider.dart';

class TheatreListScreen extends StatefulWidget {
  const TheatreListScreen({Key? key}) : super(key: key);

  @override
  State<TheatreListScreen> createState() => _TheatreListScreenState();
}

class _TheatreListScreenState extends State<TheatreListScreen> {
  int? isDateSelected = 0;
  String? date;

  int? dateindex = 0;

  //get index => isDateSelected;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    final dateAndMonthList = Provider.of<DatesProvider>(context);
    final theatreList = Provider.of<TheatreList>(context);

    Map<String, Object> dateAndDay = dateAndMonthList.dateList[dateindex!];
    date =
        "${dateAndDay['day']}, ${dateAndDay['date']}  ${dateAndDay['month']}";
    List dateWidgets = dateAndMonthList.dateList.map(
      (data) {
        int index = dateAndMonthList.dateList.indexOf(data);

        return dateAndTimeCardGenerator(
            data, h, w, data['isDateSelected'] as bool, index);
      },
    ).toList();
    print(date);

    void changeDateIndex(int i) {
      setState(() {
        isDateSelected = i;
        dateindex = i;

        print(isDateSelected);
      });
    }

    return Scaffold(
      appBar: AppBar(
        actions: [],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: h * 0.10,
              child: ListView.builder(
                //shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: dateWidgets.length,
                itemBuilder: (context, index) => (Container(
                    color: isDateSelected != null && isDateSelected == index
                        ? Colors.red[700]
                        : Colors.white,
                    height: h * 0.1,
                    width: w * 0.14,
                    child: InkWell(
                        onTap: () {
                          print(index);
                          setState(() {
                            isDateSelected = index;
                          });
                        },
                        child: dateWidgets[index]))),
              ),
            ),
            const Divider(height: 1),
            Container(
              height: h * 0.057,
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.only(left: w * 0.03),
              child: Row(
                children: [
                  Text(
                    "English",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: w * 0.03),
                  ),
                  SizedBox(width: w * 0.02),
                  Icon(
                    Icons.circle,
                    size: w * 0.01,
                  ),
                  SizedBox(width: w * 0.02),
                  Text(
                    "2D",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: w * 0.03),
                  ),
                ],
              ),
            ),
            Flexible(
              child: PageView.builder(
                onPageChanged: (value) => changeDateIndex(value),
                itemCount: theatreList.theatreList.length,
                scrollDirection: Axis.horizontal,
                physics: const ScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            color: Colors.white,
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                itemCount:
                                    theatreList.theatreList[index].length,
                                itemBuilder: (context, i) {
                                  Theatre theatre =
                                      theatreList.theatreList[index][i];
                                  return Container(
                                    padding: const EdgeInsets.all(20),
                                    height: 200,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.only(top: 2),
                                              child: Icon(
                                                Icons.favorite_border_outlined,
                                                size: 15,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                              width: w * 0.7,
                                              child: Text(
                                                theatre.theatreName.toString(),
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        theatre.isCancellationAvailable == true
                                            ? const Text(
                                                "Cancellation Available",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey),
                                              )
                                            : Text(""),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  dateAndTimeCardGenerator(
      Map<String, Object> e, double h, double w, bool isSelected, int index) {
    return Padding(
      padding: EdgeInsets.all(w * 0.02),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(e['day'].toString().toUpperCase()),
        Text(
          e['date'].toString(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(e['month'].toString().toUpperCase())
      ]),
    );
  }
}
