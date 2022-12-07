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
    // final instanceChecker =
    //     FirebaseFirestore.instance.collection("instanceChecker").doc();
    obj = TheatreSeats(
        docid: docUser.id, time: time, date: date, theatre: theatre);
    final json = obj.toJson();
    //print("Json part +${json}");
    await docUser.set(json);
    notifyListeners();
  }

  Stream<List<TheatreSeats>> readTheatreInstance(
      // String date, String time, int theatreId
      ) {
    //String str = obj.docid;
    print("hello");
    return FirebaseFirestore.instance
        .collection("theatrelist")
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) =>
                    // if (doc.data()['date'].toString() == date &&
                    //     doc.data()['time'].toString() == time &&
                    //     doc.data()['theatre']['theatreId'].toString() ==
                    //         (theatreId + 1).toString()) {
                    TheatreSeats.fromJson(doc.data())
                // return doc.data();
                //}
                )
            .toList());
    // print(json.toString());
    // notifyListeners();
    //   return json;
    // .where("date", isEqualTo: date)
    // .where("time", isEqualTo: "time")
    // .where("theatreid", isEqualTo: (theatreId + 1).toString())
    // .get();

    //obj = TheatreSeats.fromJson(json as Map<String, dynamic>);
    //print(obj.theatre.seatList[0].seat[1].seatPrice);
  }
}
