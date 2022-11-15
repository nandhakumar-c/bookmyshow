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
        SeatsClass(seatId: '00', seatNo: 'A1', seatPrice: 190.78),
        SeatsClass(seatId: '01', seatNo: 'A2', seatPrice: 190.78),
        SeatsClass(seatId: '02', seatNo: 'A3', seatPrice: 190.78),
        SeatsClass(seatId: '03', seatNo: 'A4', seatPrice: 190.78),
        SeatsClass(seatId: '04', seatNo: 'A5', seatPrice: 190.78),
        SeatsClass(seatId: '05', seatNo: 'A6', seatPrice: 190.78),
        SeatsClass(seatId: '-1', seatNo: '-1'),
        SeatsClass(seatId: '06', seatNo: 'A7', seatPrice: 190.78),
        SeatsClass(seatId: '07', seatNo: 'A8', seatPrice: 190.78),
        SeatsClass(seatId: '08', seatNo: 'A9', seatPrice: 190.78),
        SeatsClass(seatId: '09', seatNo: 'A10', seatPrice: 190.78),
        SeatsClass(seatId: '010', seatNo: 'A11', seatPrice: 190.78),
        SeatsClass(seatId: '011', seatNo: 'A12', seatPrice: 190.78),
        SeatsClass(seatId: '012', seatNo: 'A13', seatPrice: 190.78),
        SeatsClass(seatId: '013', seatNo: 'A14', seatPrice: 190.78),
        SeatsClass(seatId: '014', seatNo: 'A15', seatPrice: 190.78),
        SeatsClass(seatId: '015', seatNo: 'A16', seatPrice: 190.78),
        SeatsClass(seatId: '016', seatNo: 'A17', seatPrice: 190.78),
        SeatsClass(seatId: '017', seatNo: 'A18', seatPrice: 190.78),
        SeatsClass(seatId: '018', seatNo: 'A19', seatPrice: 190.78),
        SeatsClass(seatId: '019', seatNo: 'A20', seatPrice: 190.78),
        SeatsClass(seatId: '020', seatNo: 'A21', seatPrice: 190.78),
      ],
    ])
  ];
}
