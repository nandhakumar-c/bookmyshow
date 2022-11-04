import 'package:bookmyshow/landingpage/pagebuilder/descriptionpage/ticketbookingpage/seatingpage/seatcount.dart';
import 'package:bookmyshow/profilepage/cardgenerator/screens/orders_screen.dart';
import 'package:bookmyshow/provider/orders_provider.dart';
import 'package:bookmyshow/provider/tickets_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../bottomnavigation/bottomnavigator.dart';

class SeatingPage extends StatefulWidget {
  String? theatreName;
  String? imgUrl;
  String? movieName;
  int id;
  String? date;
  String time;
  SeatingPage(
      {Key? key,
      this.imgUrl,
      this.theatreName,
      this.date,
      this.movieName,
      required this.time,
      required this.id})
      : super(key: key);

  @override
  State<SeatingPage> createState() => _SeatingPageState();
}

class _SeatingPageState extends State<SeatingPage> {
  List<Container> rows = [];
  bool isSelected = false;

  List<Map<int, bool>> selectedSeats =
      List.generate(5, (index) => {index: false});

  @override
  Widget build(BuildContext context) {
    final ticket = Provider.of<TicketList>(context);
    final orders = Provider.of<OrdersList>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            return Navigator.of(context).pop();
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.movieName.toString(),
              style: const TextStyle(fontSize: 15),
            ),
            Text(
              widget.theatreName.toString(),
              style: const TextStyle(fontSize: 10),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 6, 20, 32),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                // color: Color.fromARGB(255, 3, 142, 255),
                child: Row(
                  children: [
                    Expanded(child: seatsBuilder(10, 12, ticket)),
                  ],
                )),
            // Container(
            //     height: 130,
            //     width: 400,
            //     alignment: Alignment.center,
            //     padding: const EdgeInsets.all(10),
            //     // color: Color.fromARGB(255, 3, 142, 255),
            //     child: Row(
            //       children: [
            //         const Spacer(),
            //         seatsBuilder(3, 12, ticket),
            //         const Spacer(),
            //       ],
            //     )),
            // Container(
            //     height: 150,
            //     width: double.infinity,
            //     alignment: Alignment.center,
            //     padding: const EdgeInsets.all(10),
            //     // color: Color.fromARGB(255, 3, 142, 255),
            //     child: Row(
            //       children: [
            //         const Spacer(),
            //         seatsBuilder(2, 12, ticket),
            //         const Spacer(),
            //       ],
            //     )),
            // const SizedBox(
            //   height: 5,
            // ),
            Container(
              color: Colors.blue[100],
              height: 100,
              width: 200,
              child: Column(
                children: [Text("testing")],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: ticket.numberOfSeats == ticket.seatsFilled
                        ? Colors.green
                        : Colors.grey[400]),
                onPressed: () {
                  orders.addOrder(widget.imgUrl, widget.theatreName,
                      widget.date, widget.movieName, widget.time, ticket.seats);
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BottomNavigation(),
                  ));
                },
                child: const Text("Confirm seats")),
            const SizedBox(
              height: 30,
            ),
            Container(height: 20, child: SeatCount())
          ],
        ),
      ),
    );
  }

  Widget seatsBuilder(int column, int row, TicketList ticket) {
    return Column(
      children: [
        Column(
          children: [
            ...List.generate(
              column,
              (index) => Row(
                children: List.generate(
                  row,
                  (i) => index == 5 || index == 8
                      ? Column(
                          children: [
                            const SizedBox(
                              height: 25,
                            ),
                            seatsGenerator(ticket, index, i),
                          ],
                        )
                      : seatsGenerator(ticket, index, i),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget seatsGenerator(TicketList ticket, int index, int i) {
    return i == 0
        ? Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: 20,
              width: 20,
              child: Center(
                child: Text(
                  String.fromCharCode(65 + index),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        : GestureDetector(
            onTap: () {
              String seatID = "${String.fromCharCode(65 + index)}$i";
              if (ticket.selectedSeats[index][i][seatID] == false &&
                  ticket.numberOfSeats > ticket.seatsFilled) {
                //adding seat id
                ticket.addSeats(seatID);
                //for changing color
                ticket.selectedSeats[index][i][seatID] = true;
                //adding seat count
                ticket.fillSeat();
              } else if (ticket.numberOfSeats > ticket.seatsFilled) {
                print(ticket.selectedSeats[index][i][seatID]);
                //for removing the color
                ticket.selectedSeats[index][i][seatID] = false;
                //for removing the seats in the list
                ticket.removeSeats(seatID);
                //subtracting the seat count
                ticket.removeSeat();
              } else if (ticket.numberOfSeats == ticket.seatsFilled) {
                //changing the  seats once it is filled
                ticket.refreshSeats();
                ticket.addSeats(seatID);
                ticket.fillSeat();
                ticket.selectedSeats[index][i][seatID] = true;
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Seats filled !"),
                ));
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: ticket.selectedSeats[index][i]
                              ["${String.fromCharCode(65 + index)}$i"] ==
                          true
                      ? Colors.green[500]
                      : Colors.grey[400],
                ),
                height: 20,
                width: 20,
                child: Center(
                  child: Text(
                    i.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                  ),
                ),
              ),
            ),
          );
  }
}
