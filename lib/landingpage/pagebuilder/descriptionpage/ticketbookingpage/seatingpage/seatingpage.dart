import 'package:bookmyshow/provider/tickets_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SeatingPage extends StatefulWidget {
  String? theatreName;
  String? movieName;
  int id;
  String time;
  SeatingPage(
      {Key? key,
      this.theatreName,
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
                height: 200,
                width: 400,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                // color: Color.fromARGB(255, 3, 142, 255),
                child: Row(
                  children: [
                    const Spacer(),
                    seatsBuilder(5, 12, ticket),
                    const Spacer(),
                  ],
                )),
            Container(
                height: 130,
                width: 400,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                // color: Color.fromARGB(255, 3, 142, 255),
                child: Row(
                  children: [
                    const Spacer(),
                    seatsBuilder(3, 12, ticket),
                    const Spacer(),
                  ],
                )),
            Container(
                height: 150,
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                // color: Color.fromARGB(255, 3, 142, 255),
                child: Row(
                  children: [
                    const Spacer(),
                    seatsBuilder(2, 12, ticket),
                    const Spacer(),
                  ],
                )),
            const SizedBox(
              height: 5,
            ),
            Container(
              color: Colors.blue[100],
              height: 100,
              width: 200,
              child: Column(
                children: [
                  if (ticket.ticketmap.isEmpty) const Text("select seat"),
                  if (ticket.ticketmap.isNotEmpty)
                    if (ticket.availableTickets.values.first.theatreName !=
                        null)
                      Text(
                          "${ticket.availableTickets.values.map((e) => e.theatreName)}")
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => ticket.confirmTickets(),
                child: const Text("Confirm seats"))
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
                  (i) => i == 0
                      ? Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            height: 20,
                            width: 20,
                            child: Text(
                              String.fromCharCode(65 + index),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            setState(() {
                              isSelected = !isSelected;
                            });
                            if (true) {
                              ticket.addSeats(
                                  "${String.fromCharCode(65 + index)}$i");
                              ticket.addTickets(
                                  widget.id.toString(),
                                  widget.theatreName!,
                                  widget.movieName!,
                                  isSelected,
                                  widget.time,
                                  ["$index"]);
                            } else {
                              ticket.removeTickets(widget.id.toString());
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              height: 20,
                              width: 20,
                              color: isSelectedFunction(i, index)
                                  ? Colors.green
                                  : Colors.grey,
                              child: Text(
                                i.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 13),
                              ),
                            ),
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  bool isSelectedFunction(int i, int index) {
    selectedSeats[index][index] = !selectedSeats[index][index]!;
    // print(selectedSeats);
    // print("hello");
    return selectedSeats[index][index]!;
  }
}
