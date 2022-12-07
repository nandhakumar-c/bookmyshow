import 'package:bookmyshow/landingpage/models/theatreseat_model.dart';
import 'package:bookmyshow/landingpage/services/theatreseat_service.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: TheatreSeatService().readTheatreInstance(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong : ${snapshot.error}");
          } else if (snapshot.hasData) {
            List<TheatreSeats> data = snapshot.data! as List<TheatreSeats>;
            return Center(
                child: Text("${data[0].theatre.seatList[0].seat[0].seatId}"));
            // return ListView.builder(
            //   itemCount: data.length,
            //   itemBuilder: (context, index) {
            //     Text(data[index].toString());
            //   },
            //   shrinkWrap: true,
            //   physics: const NeverScrollableScrollPhysics(),
            // );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
