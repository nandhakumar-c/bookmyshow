import 'package:bookmyshow/provider/theatreseat_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/theatreseat_model.dart';

class TheatreSeatService extends ChangeNotifier {
  late TheatreSeats obj;
  void createTheatreInstance(String date, String time, String theatreId) async {
    Theatre theatre =
        TheatreSeatsList().theatreSeatsList[int.parse(theatreId) - 1];
    final docUser = FirebaseFirestore.instance.collection("theatrelist").doc();
    obj = TheatreSeats(
        docid: docUser.id, time: time, date: date, theatre: theatre);
    final json = obj.toJson();
    print("Json part +${json}");
    await docUser.set(json);
    notifyListeners();
  }

  void readTheatreInstance(String date, String time, int theatreId) async {
    //String str = obj.docid;
    final json = await FirebaseFirestore.instance
        .collection("theatrelist")
        .where("date", isEqualTo: date)
        .where("time", isEqualTo: "time")
        .where("theatreid", isEqualTo: (theatreId + 1).toString())
        .get();
    print(json);

    obj = theatreSeatsFromJson(json.toString());
    notifyListeners();
  }
}
