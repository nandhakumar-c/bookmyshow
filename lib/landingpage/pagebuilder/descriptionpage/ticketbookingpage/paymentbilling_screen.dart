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
          backgroundColor: Color.fromARGB(255, 225, 231, 234),
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
                color: Color.fromARGB(255, 225, 231, 234),
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
                              children: const [
                                Text(
                                  "Movie Name",
                                  style: TextStyle(
                                      fontSize: 18,
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
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Tamil, 2D",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                                Text("M-Ticket",
                                    style: TextStyle(color: Colors.red))
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Mon, 28 Nov 2022 | 06:30 PM",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Murugan Cinemas AC 4K Atmos: Thudiyalur",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 37,
                            ),
                            const Divider(
                              indent: 10,
                              endIndent: 10,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              // padding: EdgeInsets.only(left: 5, right: 10),
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text("Ticket Price",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text("\$190.78"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text("Convenience fees",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Text("\$37.76"),
                                  ],
                                ),
                              ],
                            )
                          ]),
                    )
                  ],
                ),
              ),
              Container(
                color: Color.fromARGB(255, 225, 231, 234),
                height: h,
                width: double.infinity,
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Total Payable Amount",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("\$37.76"),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        indent: 5,
                        endIndent: 5,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Contact Details",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 2,
          child: Container(
            height: h * 0.06,
            padding: EdgeInsets.only(
                left: w * 0.03,
                right: w * 0.03,
                bottom: w * 0.02,
                top: w * 0.01),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 231, 48, 72)),
              child: Text(
                "Pay \$229.54",
                style:
                    TextStyle(fontSize: w * 0.04, fontWeight: FontWeight.w400),
              ),
            ),
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
    path.lineTo(0, 240);
    path.lineTo(size.width, 240);
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
