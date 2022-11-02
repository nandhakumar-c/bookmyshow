import 'package:bookmyshow/provider/tickets_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SeatCount extends StatefulWidget {
  const SeatCount({Key? key}) : super(key: key);

  @override
  State<SeatCount> createState() => _SeatCountState();
}

class _SeatCountState extends State<SeatCount> {
  List<int> seatCount = List.generate(10, (index) => index);
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final seatCountProvider = Provider.of<TicketList>(context);

    return ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 20),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: seatCount.length,
        itemBuilder: (context, index) => InkWell(
              onTap: () {
                seatCountProvider.seatCounter(index + 1);
                seatCountProvider.emptySeat();
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                height: 5,
                width: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: selectedIndex == index
                        ? Colors.red[500]
                        : Colors.grey[400]),
                child: Center(
                  child: Text(
                    "${seatCount[index] + 1}",
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
            ));
  }
}
