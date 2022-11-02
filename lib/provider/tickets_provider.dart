import 'package:flutter/cupertino.dart';

class Tickets {
  final String? theatreName;
  final String? movieName;

  String? time = " ";
  List<String> seat;

  Tickets({this.theatreName, this.movieName, this.time, required this.seat});
}

class TicketList with ChangeNotifier {
  int numberOfSeats = 1;
  int seatsFilled = 0;
  List<String> seats = [];
  List<List<Map<String, bool>>> selectedSeats = List.generate(
      10,
      (index) => List.generate(
            12,
            (i) => {"${String.fromCharCode(65 + index)}$i": false},
          ));

  void seatCounter(int n) {
    numberOfSeats = n;
    print(numberOfSeats);
    notifyListeners();
  }

  void fillSeat() {
    if (seatsFilled < 10 && seatsFilled <= numberOfSeats) {
      seatsFilled++;
    }
    print("seatsFilled : $seatsFilled");
    notifyListeners();
  }

  void removeSeat() {
    if (seatsFilled != 0 && seatsFilled <= numberOfSeats) {
      seatsFilled--;
    }
    print("seatsRemoved : $seatsFilled");
    notifyListeners();
  }

  void emptySeat() {
    seatsFilled = 0;
    selectedSeats = List.generate(
        10,
        (index) => List.generate(
              12,
              (i) => {"${String.fromCharCode(65 + index)}$i": false},
            ));
    seats = [];
    notifyListeners();
  }

  void refreshSeats() {
    seatsFilled = 0;
    selectedSeats = List.generate(
        10,
        (index) => List.generate(
              12,
              (i) => {"${String.fromCharCode(65 + index)}$i": false},
            ));
    seats = [];
    notifyListeners();
  }

  void addSeats(String seat) {
    //print(selectedSeats);
    seats.add(seat);
    print("add seats ${seats}");
    notifyListeners();
  }

  void removeSeats(String seat) {
    //print(selectedSeats);
    seats.removeWhere((element) => element == seat);
    print("rmv seats ${seats}");
    notifyListeners();
  }
}
