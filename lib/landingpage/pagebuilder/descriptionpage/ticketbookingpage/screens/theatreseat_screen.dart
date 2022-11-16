import 'package:bookmyshow/provider/theatreseat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../provider/theatrelist_provider.dart';

class TheatreSeatScreen extends StatefulWidget {
  String? theatreName = "SPI: The Cinema, Brookefields Mall";
  TheatreSeatScreen({this.theatreName, Key? key}) : super(key: key);

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
    const xTranslate = 450.0;
    const yTranslate = 0.0;

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
    const xTranslate = 450.0;
    const yTranslate = 0.0;

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
  void dispose() {
    _controllerReset.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final seatsProvider = Provider.of<TheatreSeatsList>(context);

    final seats = seatsProvider.theatreSeatsList[0];
    return Scaffold(
      appBar: AppBar(title: Text("TheatreSeatScreen")),
      body: InteractiveViewer(
        child: ListView.separated(
            shrinkWrap: true,
            //scrollDirection: Axis.vertical,
            // physics: ScrollPhysics(),
            itemBuilder: (context, index) => Row(children: [
                  SizedBox(
                    height: 5,
                    width: 5,
                    child: Center(
                        child: Text(
                            seats.seatLayout![index][0].seatNo.toString()[0])),
                  ),
                  SizedBox(
                      height: 5,
                      //width: double.infinity,
                      child: seatLayoutBuilder(seats.seatLayout![index]))
                  // ...seats.seatLayout!
                  //     .map((e) =>
                  //         SizedBox(height: 20, child: seatLayoutBuilder(e)))
                  //     .toList()
                ]),
            separatorBuilder: (context, index) => const SizedBox(height: 2),
            itemCount: seats.seatLayout!.length),
      ),
    );
  }

  seatLayoutBuilder(List<SeatsClass> e) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
        width: 5,
      ),
      shrinkWrap: true,
      physics: ScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: e.length,
      itemBuilder: (context, index) => e[index].seatNo.toString() != '-1'
          ? Container(
              height: 5,
              width: 5,
              decoration: BoxDecoration(
                  // color: Colors.red,
                  border: Border.all(color: Colors.green, width: 0.5),
                  borderRadius: BorderRadius.circular(0.25)),
              child: Center(
                child: Text(
                  e[index].seatId.toString(),
                  style: const TextStyle(fontSize: 2),
                ),
              ),
            )
          : const SizedBox(
              height: 5,
              width: 5,
            ),
    );
  }
}
