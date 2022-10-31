import 'package:flutter/cupertino.dart';

class Tickets {
  final String? theatreName;
  final String? movieName;
  bool isSelected = false;
  String? time = " ";
  List<String> seat;

  Tickets(
      {this.theatreName,
      this.movieName,
      this.isSelected = false,
      this.time,
      required this.seat});
}

class TicketList with ChangeNotifier {
  Map<String, Tickets> ticketmap = {};
  Map<int, Tickets> confirmedTickets = {};
  List<String> seats = [];
  List<List<Map<String, bool>>> selectedSeats = List.generate(
      5,
      (index) => List.generate(
            10,
            (i) => {"${String.fromCharCode(65 + index)}$i}": false},
          ));

  void addSeats(String seat) {
    print(selectedSeats);
    seats.add(seat);
    print(seats);
    notifyListeners();
  }

  void addTickets(String id, String theatreName, String movieName,
      bool isSelected, String time, List<String> seat) {
    ticketmap.putIfAbsent(id, () {
      return Tickets(
          theatreName: theatreName,
          movieName: movieName,
          isSelected: isSelected,
          time: time,
          seat: seat);
    });
    print(
        "${ticketmap.keys.map((e) => e)} -> ${ticketmap.values.map((e) => e.seat)}");
    notifyListeners();
  }

  void removeTickets(String id) {
    ticketmap.removeWhere((key, value) {
      return key == id;
    });
    //print(selectedSeats);
    print(
        "${ticketmap.keys.map((e) => e)} -> ${ticketmap.values.map((e) => e.theatreName)}");
    notifyListeners();
  }

  Map<String, Tickets> get availableTickets {
    return {...ticketmap};
  }

  int i = 0;
  void confirmTickets() {
    confirmedTickets.putIfAbsent(i, () => ticketmap.values.first);
    i++;
    notifyListeners();
  }
}
