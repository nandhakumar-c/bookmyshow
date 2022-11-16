import 'package:flutter/material.dart';

class SeatsClass {
  String? seatId;
  String? seatNo = '0';
  bool? isOccupied = false;
  bool? isSelected = false;
  double? seatPrice;
  SeatsClass(
      {this.seatId,
      this.seatNo,
      this.isOccupied,
      this.isSelected,
      this.seatPrice});
}

class TheatreSeats {
  String? theatreId;
  List<List<SeatsClass>>? seatLayout;
  TheatreSeats({this.theatreId, this.seatLayout});
}

class TheatreSeatsList with ChangeNotifier {
  List<TheatreSeats> theatreSeatsList = [
    TheatreSeats(theatreId: '1', seatLayout: [
      [
        SeatsClass(seatId: '1', seatNo: 'A1', seatPrice: 190.78),
        SeatsClass(seatId: '2', seatNo: 'A2', seatPrice: 190.78),
        SeatsClass(seatId: '3', seatNo: 'A3', seatPrice: 190.78),
        SeatsClass(seatId: '4', seatNo: 'A4', seatPrice: 190.78),
        SeatsClass(seatId: '5', seatNo: 'A5', seatPrice: 190.78),
        SeatsClass(seatId: '6', seatNo: 'A6', seatPrice: 190.78),
        SeatsClass(seatId: '-1', seatNo: '-1'),
        SeatsClass(seatId: '7', seatNo: 'A7', seatPrice: 190.78),
        SeatsClass(seatId: '8', seatNo: 'A8', seatPrice: 190.78),
        SeatsClass(seatId: '9', seatNo: 'A9', seatPrice: 190.78),
        SeatsClass(seatId: '10', seatNo: 'A10', seatPrice: 190.78),
        SeatsClass(seatId: '11', seatNo: 'A11', seatPrice: 190.78),
        SeatsClass(seatId: '12', seatNo: 'A12', seatPrice: 190.78),
        SeatsClass(seatId: '-1', seatNo: '-1'),
        SeatsClass(seatId: '13', seatNo: 'A13', seatPrice: 190.78),
        SeatsClass(seatId: '14', seatNo: 'A14', seatPrice: 190.78),
        SeatsClass(seatId: '15', seatNo: 'A15', seatPrice: 190.78),
        SeatsClass(seatId: '16', seatNo: 'A16', seatPrice: 190.78),
        SeatsClass(seatId: '17', seatNo: 'A17', seatPrice: 190.78),
        SeatsClass(seatId: '18', seatNo: 'A18', seatPrice: 190.78),
        SeatsClass(seatId: '19', seatNo: 'A19', seatPrice: 190.78),
        SeatsClass(seatId: '20', seatNo: 'A20', seatPrice: 190.78),
        SeatsClass(seatId: '21', seatNo: 'A21', seatPrice: 190.78),
      ],
      [
        SeatsClass(seatId: '1', seatNo: 'A1', seatPrice: 190.78),
        SeatsClass(seatId: '2', seatNo: 'A2', seatPrice: 190.78),
        SeatsClass(seatId: '3', seatNo: 'A3', seatPrice: 190.78),
        SeatsClass(seatId: '4', seatNo: 'A4', seatPrice: 190.78),
        SeatsClass(seatId: '5', seatNo: 'A5', seatPrice: 190.78),
        SeatsClass(seatId: '6', seatNo: 'A6', seatPrice: 190.78),
        SeatsClass(seatId: '-1', seatNo: '-1'),
        SeatsClass(seatId: '7', seatNo: 'A7', seatPrice: 190.78),
        SeatsClass(seatId: '8', seatNo: 'A8', seatPrice: 190.78),
        SeatsClass(seatId: '9', seatNo: 'A9', seatPrice: 190.78),
        SeatsClass(seatId: '10', seatNo: 'A10', seatPrice: 190.78),
        SeatsClass(seatId: '11', seatNo: 'A11', seatPrice: 190.78),
        SeatsClass(seatId: '12', seatNo: 'A12', seatPrice: 190.78),
        SeatsClass(seatId: '-1', seatNo: '-1'),
        SeatsClass(seatId: '13', seatNo: 'A13', seatPrice: 190.78),
        SeatsClass(seatId: '14', seatNo: 'A14', seatPrice: 190.78),
        SeatsClass(seatId: '15', seatNo: 'A15', seatPrice: 190.78),
        SeatsClass(seatId: '16', seatNo: 'A16', seatPrice: 190.78),
        SeatsClass(seatId: '17', seatNo: 'A17', seatPrice: 190.78),
        SeatsClass(seatId: '18', seatNo: 'A18', seatPrice: 190.78),
        SeatsClass(seatId: '19', seatNo: 'A19', seatPrice: 190.78),
        SeatsClass(seatId: '20', seatNo: 'A20', seatPrice: 190.78),
        SeatsClass(seatId: '21', seatNo: 'A21', seatPrice: 190.78),
      ],
      [
        SeatsClass(seatId: '1', seatNo: 'A1', seatPrice: 190.78),
        SeatsClass(seatId: '2', seatNo: 'A2', seatPrice: 190.78),
        SeatsClass(seatId: '3', seatNo: 'A3', seatPrice: 190.78),
        SeatsClass(seatId: '4', seatNo: 'A4', seatPrice: 190.78),
        SeatsClass(seatId: '5', seatNo: 'A5', seatPrice: 190.78),
        SeatsClass(seatId: '6', seatNo: 'A6', seatPrice: 190.78),
        SeatsClass(seatId: '-1', seatNo: '-1'),
        SeatsClass(seatId: '7', seatNo: 'A7', seatPrice: 190.78),
        SeatsClass(seatId: '8', seatNo: 'A8', seatPrice: 190.78),
        SeatsClass(seatId: '9', seatNo: 'A9', seatPrice: 190.78),
        SeatsClass(seatId: '10', seatNo: 'A10', seatPrice: 190.78),
        SeatsClass(seatId: '11', seatNo: 'A11', seatPrice: 190.78),
        SeatsClass(seatId: '12', seatNo: 'A12', seatPrice: 190.78),
        SeatsClass(seatId: '-1', seatNo: '-1'),
        SeatsClass(seatId: '13', seatNo: 'A13', seatPrice: 190.78),
        SeatsClass(seatId: '14', seatNo: 'A14', seatPrice: 190.78),
        SeatsClass(seatId: '15', seatNo: 'A15', seatPrice: 190.78),
        SeatsClass(seatId: '16', seatNo: 'A16', seatPrice: 190.78),
        SeatsClass(seatId: '17', seatNo: 'A17', seatPrice: 190.78),
        SeatsClass(seatId: '18', seatNo: 'A18', seatPrice: 190.78),
        SeatsClass(seatId: '19', seatNo: 'A19', seatPrice: 190.78),
        SeatsClass(seatId: '20', seatNo: 'A20', seatPrice: 190.78),
        SeatsClass(seatId: '21', seatNo: 'A21', seatPrice: 190.78),
      ],
      [
        SeatsClass(seatId: '1', seatNo: 'A1', seatPrice: 190.78),
        SeatsClass(seatId: '2', seatNo: 'A2', seatPrice: 190.78),
        SeatsClass(seatId: '3', seatNo: 'A3', seatPrice: 190.78),
        SeatsClass(seatId: '4', seatNo: 'A4', seatPrice: 190.78),
        SeatsClass(seatId: '5', seatNo: 'A5', seatPrice: 190.78),
        SeatsClass(seatId: '6', seatNo: 'A6', seatPrice: 190.78),
        SeatsClass(seatId: '-1', seatNo: '-1'),
        SeatsClass(seatId: '7', seatNo: 'A7', seatPrice: 190.78),
        SeatsClass(seatId: '8', seatNo: 'A8', seatPrice: 190.78),
        SeatsClass(seatId: '9', seatNo: 'A9', seatPrice: 190.78),
        SeatsClass(seatId: '10', seatNo: 'A10', seatPrice: 190.78),
        SeatsClass(seatId: '11', seatNo: 'A11', seatPrice: 190.78),
        SeatsClass(seatId: '12', seatNo: 'A12', seatPrice: 190.78),
        SeatsClass(seatId: '-1', seatNo: '-1'),
        SeatsClass(seatId: '13', seatNo: 'A13', seatPrice: 190.78),
        SeatsClass(seatId: '14', seatNo: 'A14', seatPrice: 190.78),
        SeatsClass(seatId: '15', seatNo: 'A15', seatPrice: 190.78),
        SeatsClass(seatId: '16', seatNo: 'A16', seatPrice: 190.78),
        SeatsClass(seatId: '17', seatNo: 'A17', seatPrice: 190.78),
        SeatsClass(seatId: '18', seatNo: 'A18', seatPrice: 190.78),
        SeatsClass(seatId: '19', seatNo: 'A19', seatPrice: 190.78),
        SeatsClass(seatId: '20', seatNo: 'A20', seatPrice: 190.78),
        SeatsClass(seatId: '21', seatNo: 'A21', seatPrice: 190.78),
      ],
      [
        SeatsClass(seatId: '1', seatNo: 'A1', seatPrice: 190.78),
        SeatsClass(seatId: '2', seatNo: 'A2', seatPrice: 190.78),
        SeatsClass(seatId: '3', seatNo: 'A3', seatPrice: 190.78),
        SeatsClass(seatId: '4', seatNo: 'A4', seatPrice: 190.78),
        SeatsClass(seatId: '5', seatNo: 'A5', seatPrice: 190.78),
        SeatsClass(seatId: '6', seatNo: 'A6', seatPrice: 190.78),
        SeatsClass(seatId: '-1', seatNo: '-1'),
        SeatsClass(seatId: '7', seatNo: 'A7', seatPrice: 190.78),
        SeatsClass(seatId: '8', seatNo: 'A8', seatPrice: 190.78),
        SeatsClass(seatId: '9', seatNo: 'A9', seatPrice: 190.78),
        SeatsClass(seatId: '10', seatNo: 'A10', seatPrice: 190.78),
        SeatsClass(seatId: '11', seatNo: 'A11', seatPrice: 190.78),
        SeatsClass(seatId: '12', seatNo: 'A12', seatPrice: 190.78),
        SeatsClass(seatId: '-1', seatNo: '-1'),
        SeatsClass(seatId: '13', seatNo: 'A13', seatPrice: 190.78),
        SeatsClass(seatId: '14', seatNo: 'A14', seatPrice: 190.78),
        SeatsClass(seatId: '15', seatNo: 'A15', seatPrice: 190.78),
        SeatsClass(seatId: '16', seatNo: 'A16', seatPrice: 190.78),
        SeatsClass(seatId: '17', seatNo: 'A17', seatPrice: 190.78),
        SeatsClass(seatId: '18', seatNo: 'A18', seatPrice: 190.78),
        SeatsClass(seatId: '19', seatNo: 'A19', seatPrice: 190.78),
        SeatsClass(seatId: '20', seatNo: 'A20', seatPrice: 190.78),
        SeatsClass(seatId: '21', seatNo: 'A21', seatPrice: 190.78),
      ],
    ])
  ];
}
