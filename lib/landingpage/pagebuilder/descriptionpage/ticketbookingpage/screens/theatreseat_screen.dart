import 'package:bookmyshow/landingpage/pagebuilder/descriptionpage/ticketbookingpage/payment_screens/paymentbilling_screen.dart';
import 'package:bookmyshow/landingpage/pagebuilder/descriptionpage/ticketbookingpage/screens/seatcount.dart';
import 'package:bookmyshow/provider/theatreseat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../bottomnavigation/bottomnavigator.dart';
import '../../../../../provider/orders_provider.dart';
import '../../../../../provider/theatrelist_provider.dart';
import '../../../../../provider/tickets_provider.dart';

class TheatreSeatScreen extends StatefulWidget {
  String? theatreName;
  String? movieName;
  String? theatreId;
  String? imgUrl;

  int id;
  String? date;
  String time;
  TheatreSeatScreen(
      {this.movieName,
      required this.id,
      required this.time,
      this.date,
      this.theatreId,
      this.theatreName,
      this.imgUrl,
      Key? key})
      : super(key: key);

  @override
  State<TheatreSeatScreen> createState() => _TheatreSeatScreenState();
}

class _TheatreSeatScreenState extends State<TheatreSeatScreen>
    with TickerProviderStateMixin {
  List<Container> rows = [];
  bool isSelected = false;
  String vehicleImg = "";
  List<Map<int, bool>> selectedSeats =
      List.generate(5, (index) => {index: false});

  final TransformationController transformationController =
      TransformationController();
  Animation<Matrix4>? _animationReset;
  late final AnimationController _controllerReset;
  void _onAnimateReset() {
    transformationController.value = _animationReset!.value;
    if (!_controllerReset.isAnimating) {
      _animationReset!.removeListener(_onAnimateReset);
      _animationReset = null;
      _controllerReset.reset();
    }
  }

  void _animateResetInitialize() {
    _controllerReset.reset();
    final val = transformationController.value;
    const zoomFactor = 4.0;
    const xTranslate = 0.0;
    const yTranslate = -10.0;

    transformationController.value.setEntry(0, 0, zoomFactor);
    transformationController.value.setEntry(1, 1, zoomFactor);
    transformationController.value.setEntry(2, 2, zoomFactor);
    transformationController.value.setEntry(0, 3, -xTranslate);
    transformationController.value.setEntry(1, 3, -yTranslate);
    _controllerReset.forward();
  }

  void _animateResetStop() {
    _controllerReset.stop();
    _animationReset?.removeListener(_onAnimateReset);
    _animationReset = null;
    _controllerReset.reset();
  }

  void onInteractionStart() {
    if (_controllerReset.status == AnimationStatus.forward) {
      _animateResetStop();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    const zoomFactor = 4.0;
    const xTranslate = 0.0;
    const yTranslate = -10.0;

    transformationController.value.setEntry(0, 0, zoomFactor);
    transformationController.value.setEntry(1, 1, zoomFactor);
    transformationController.value.setEntry(2, 2, zoomFactor);
    transformationController.value.setEntry(0, 3, -xTranslate);
    transformationController.value.setEntry(1, 3, -yTranslate);
    super.initState();

    _controllerReset = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controllerReset.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final seatsProvider = Provider.of<TheatreSeatsList>(context);
    final ticket = Provider.of<TicketList>(context);

    final orders = Provider.of<OrdersList>(context);
    int theatreId = seatsProvider.theatreSeatsList
        .indexWhere((element) => element.theatreId == widget.theatreId);
    final seats = seatsProvider.theatreSeatsList[theatreId];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          // padding: EdgeInsets.all(10),
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
            const SizedBox(
              height: 2.5,
            ),
            Text(
              widget.theatreName.toString(),
              style: const TextStyle(fontSize: 10),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 6, 20, 32),
      ),
      body: Column(children: [
        Container(
          height: 30,
          width: double.infinity,
          padding: const EdgeInsets.only(right: 20),
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () {
              ticket.defaultImg();
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
                                  fontSize: 17, fontWeight: FontWeight.w500),
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
                            child: const SeatCount(),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(255, 231, 48, 72),
                              minimumSize: const Size.fromHeight(40),
                            ),
                            onPressed: () {
                              ticket.selectSeats();
                              ticket.emptySeat();
                              seatsProvider.refreshSeats();
                              Navigator.of(context).pop();
                            },
                            child: const Text("Select Seats"),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            child: Container(
              height: 30,
              width: 80,
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
        ),
        Expanded(
          child: InteractiveViewer(
            minScale: 1,
            maxScale: 10,
            constrained: true,
            onInteractionStart: (details) {
              if (transformationController.value.getMaxScaleOnAxis() <= 3.5 ||
                  transformationController.value.getMaxScaleOnAxis() == 1.0) {
                _animateResetInitialize();
              }
              onInteractionStart();
            },
            transformationController: transformationController,
            onInteractionEnd: (details) {
              print(details);
              print(transformationController.value.getMaxScaleOnAxis());
              if (transformationController.value.getMaxScaleOnAxis() <= 3.5 ||
                  transformationController.value.getMaxScaleOnAxis() == 1.0) {
                _animateResetInitialize();
              }
            },
            boundaryMargin:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            child: Column(
              // height: double.infinity,
              children: List.generate(
                seats.seatLayout!.length,
                (index) => seats.seatLayout![index].length == 0
                    ? const SizedBox(
                        height: 5,
                        width: double.infinity,
                      )
                    : Row(children: [
                        SizedBox(
                          height: 5,
                          width: 5,
                          child: Center(
                              child: Text(
                            seats.seatLayout![index][0].seatNo[0],
                            style: const TextStyle(fontSize: 2.5),
                          )),
                        ),
                        ...seatLayoutBuilder(index, seatsProvider, theatreId,
                            seats.seatLayout![index], ticket),
                      ]),
              ),
            ),
          ),
        )
      ]),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: ticket.numberOfSeats == ticket.seatsFilled
                    ? Colors.green
                    : Colors.grey[400]),
            onPressed: () {
              if (ticket.numberOfSeats == ticket.seatsFilled) {
                orders.addOrder(widget.imgUrl, widget.theatreName, widget.date,
                    widget.movieName, widget.time, ticket.seats);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const BillingScreen(),
                ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Please select the seats"),
                ));
              }
              return;
            },
            child: const Text("Confirm seats"),
          ),
        ),
      ),
    );
  }

  seatLayoutBuilder(int i, TheatreSeatsList seatsProvider, int theatreId,
      List<SeatsClass> e, TicketList ticket) {
    return List.generate(
      e.length,
      (index) => e[index].seatId.toString() != '-1'
          ? GestureDetector(
              onTap: () {
                final seatNo = e[index].seatNo;
                if (ticket.seatsFilled < ticket.numberOfSeats &&
                    seatsProvider.theatreSeatsList[theatreId]
                            .seatLayout![i][index].isSelected ==
                        false &&
                    seatsProvider.theatreSeatsList[theatreId]
                            .seatLayout![i][index].isOccupied ==
                        false) {
                  ticket.addSeats(e[index].seatNo);
                  seatsProvider.selectSeats(i, index, theatreId, seatNo);
                  seatsProvider.theatreSeatsList[theatreId]
                      .seatLayout![i][index].isSelected = true;
                  //e[index].isSelected = true;
                  ticket.fillSeat();
                } else if (ticket.numberOfSeats > ticket.seatsFilled &&
                    seatsProvider.theatreSeatsList[theatreId]
                            .seatLayout![i][index].isSelected ==
                        true &&
                    seatsProvider.theatreSeatsList[theatreId]
                            .seatLayout![i][index].isOccupied ==
                        false) {
                  //for removing the seats in the list
                  ticket.removeSeats(seatNo);
                  seatsProvider.removeSeats(i, index, theatreId, seatNo);
                  //e[index].isSelected = false;
                  //subtracting the seat count
                  ticket.removeSeat();
                } else if (ticket.numberOfSeats == ticket.seatsFilled &&
                    seatsProvider.theatreSeatsList[theatreId]
                            .seatLayout![i][index].isOccupied ==
                        false) {
                  ticket.refreshSeats();
                  ticket.addSeats(seatNo);
                  ticket.fillSeat();
                  seatsProvider.refreshSeats();
                  seatsProvider.selectSeats(i, index, theatreId, seatNo);
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Seats filled !")));
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(0.50),
                child: Container(
                  height: 5,
                  width: 5,
                  decoration: BoxDecoration(
                      color: seatsProvider.theatreSeatsList[theatreId]
                                  .seatLayout![i][index].isOccupied ==
                              true
                          ? Colors.grey
                          : (seatsProvider.theatreSeatsList[theatreId]
                                      .seatLayout![i][index].isSelected ==
                                  true
                              ? Colors.green
                              : Colors.white),
                      border: Border.all(
                          color: seatsProvider.theatreSeatsList[theatreId]
                                      .seatLayout![i][index].isOccupied ==
                                  true
                              ? Colors.grey
                              : Colors.green,
                          width: 0.25),
                      borderRadius: BorderRadius.circular(0.5)),
                  child: Center(
                    child: Text(
                      e[index].seatId.toString(),
                      style: TextStyle(
                          color: seatsProvider.theatreSeatsList[theatreId]
                                      .seatLayout![i][index].isSelected ==
                                  false
                              ? Colors.grey
                              : Colors.white,
                          fontSize: 2.5,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            )
          : const Padding(
              padding: EdgeInsets.all(0.50),
              child: SizedBox(
                height: 5,
                width: 5,
              ),
            ),
    );
  }
}
