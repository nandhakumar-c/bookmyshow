import 'package:flutter/material.dart';

class BillingScreen extends StatefulWidget {
  const BillingScreen({super.key});

  @override
  State<BillingScreen> createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          backgroundColor: Color.fromARGB(255, 180, 176, 176),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.chevron_left,
            ),
            color: Colors.black,
            padding: EdgeInsets.zero,
            style: IconButton.styleFrom(padding: EdgeInsets.zero),
            onPressed: () {
              return Navigator.of(context).pop();
            },
          ),
          title: const Text(
            "Almost there!",
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
        ),
        //backgroundColor: Colors.grey,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Color.fromARGB(255, 180, 176, 176),
                padding: EdgeInsets.all(10),
                child: Stack(
                  children: [
                    CustomPaint(
                      size: Size(w, 200),
                      painter: TicketPainter(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Movie Name",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "2",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Text("Tamil 2D"),
                            Text(
                              "Mon, 28 Nov 2022 | 06:30 PM",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("Murugan Cinemas A?C 4K Atmos: Thudiyalur"),
                          ]),
                    )
                  ],
                ),
              ),
              Divider(),
              Container(
                color: Color.fromARGB(255, 180, 176, 176),
                height: h,
                width: double.infinity,
                padding: EdgeInsets.all(10),
                child: Text("hello"),
              ),
            ],
          ),
        ));
  }
}

class TicketPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 0);
    path.lineTo(0, 140);
    path.arcToPoint(Offset(0, 160), radius: Radius.circular(10));
    path.lineTo(0, 220);
    path.lineTo(size.width, 220);
    path.lineTo(size.width, 160);
    path.arcToPoint(Offset(size.width, 140), radius: Radius.circular(10));
    path.lineTo(size.width, 0);
    //canvas.drawShadow(path, Color.fromARGB(139, 139, 134, 134), 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
