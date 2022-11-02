import 'package:flutter/material.dart';

class Orders {
  final String? theatreName;
  final String? date;
  final String? movieName;
  final String? timeSlot;
  final List<String>? seats;
  Orders(
      {this.theatreName, this.date, this.movieName, this.timeSlot, this.seats});
}

class OrdersList with ChangeNotifier {
  List<Orders> ordersList = [];
  void addOrder(String theatreName, String date, String movieName,
      String timeSlot, List<String> seats) {
    ordersList.add(Orders(
        theatreName: theatreName,
        date: date,
        movieName: movieName,
        timeSlot: timeSlot,
        seats: seats));
  }
}
