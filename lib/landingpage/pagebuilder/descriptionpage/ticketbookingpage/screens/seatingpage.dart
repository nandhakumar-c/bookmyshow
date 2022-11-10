import 'package:bookmyshow/landingpage/pagebuilder/descriptionpage/ticketbookingpage/screens/seatcount.dart';
import 'package:bookmyshow/provider/orders_provider.dart';
import 'package:bookmyshow/provider/tickets_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
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
  String vehicleImg = "";
  List<Map<int, bool>> selectedSeats =
      List.generate(5, (index) => {index: false});
  TransformationController transformationController =
      TransformationController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    transformationController.addListener(() {
      if (transformationController.value.getMaxScaleOnAxis() < 0) {
        setState(() {
          transformationController.value = Matrix4.identity();
        });
      }
    });
  }

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
      body: Container(
        child: Column(
          children: [
            Container(
              height: 30,
              padding: const EdgeInsets.only(right: 20),
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) => SafeArea(
                      child: Container(
                        height: 350,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Container(
                                height: 50,
                                padding: const EdgeInsets.all(10),
                                child: const Text(
                                  "How many seats? ",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ),
                            Consumer<TicketList>(
                              builder: (context, value, child) {
                                return Container(
                                    alignment: Alignment.center,
                                    height: 150,
                                    child: SizedBox(
                                      height: 150,
                                      child: ticket.img,
                                    ));
                              },
                            ),
                            Flexible(
                              child: Container(
                                height: 40,
                                width: double.infinity,
                                alignment: Alignment.center,
                                child: SeatCount(),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(20),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary:
                                        const Color.fromARGB(255, 231, 48, 72),
                                    minimumSize: const Size.fromHeight(40),
                                  ),
                                  onPressed: () {
                                    ticket.selectSeats();
                                    ticket.emptySeat();
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Select Seats")),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.edit,
                      color: Colors.red,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      ticket.numberOfSeats == 1
                          ? "${ticket.numberOfSeats} Ticket"
                          : "${ticket.numberOfSeats} Tickets",
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: InteractiveViewer(
                minScale: 0.75,
                maxScale: 2.25,
                constrained: true,
                transformationController: transformationController,
                onInteractionEnd: (details) {
                  print(transformationController.value.getMaxScaleOnAxis());
                  if (transformationController.value.getMaxScaleOnAxis() <= 0) {
                    setState(() {
                      transformationController.value = Matrix4.identity();
                    });
                  }
                },
                boundaryMargin:
                    const EdgeInsets.symmetric(vertical: 250, horizontal: 300),
                child: seatsBuilder(22, 22, ticket),
                // Flexible(
                //   child: Container(
                //     alignment: Alignment.center,
                //     height: double.infinity,
                //     width: double.infinity,
                //     padding: const EdgeInsets.all(10),
                //     // color: Color.fromARGB(255, 3, 142, 255),
                //     child: seatsBuilder(22, 22, ticket),
              ),
              // ),
              // ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: ticket.numberOfSeats == ticket.seatsFilled
                    ? Colors.green
                    : Colors.grey[400]),
            onPressed: () {
              orders.addOrder(widget.imgUrl, widget.theatreName, widget.date,
                  widget.movieName, widget.time, ticket.seats);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BottomNavigation(),
              ));
            },
            child: const Text("Confirm seats"),
          ),
        ),
      ),
    );
  }

  Widget seatsBuilder(int column, int row, TicketList ticket) {
    return Column(
      //shrinkWrap: true,
      //scrollDirection: Axis.vertical,
      children: [
        ...List.generate(
          column,
          (index) => Row(
            // shrinkWrap: true,
            // physics: const ClampingScrollPhysics(),
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

  void _transformController() {
    setState(() {});
  }
}
