import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

List imgUrl = [
  'assets/images/carousel/carousel1.jpeg',
  'assets/images/carousel/carousel2.jpg',
  'assets/images/carousel/carousel3.jpg',
  'assets/images/carousel/carousel4.png'
];

class CarouselBuilder extends StatefulWidget {
  const CarouselBuilder({Key? key}) : super(key: key);

  @override
  State<CarouselBuilder> createState() => _CarouselBuilderState();
}

class _CarouselBuilderState extends State<CarouselBuilder> {
  int _activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    void state(int index) {
      setState(() {
        _activeIndex = index;
      });
    }

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: h * 0.02),
      child: Container(
        color: Colors.grey[300],
        height: h * 0.22,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CarouselSlider.builder(
              options: CarouselOptions(
                viewportFraction: 1,
                //height: h * 0.24,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 2),
                onPageChanged: (index, reason) => state(index),
              ),
              itemCount: imgUrl.length,
              itemBuilder: (context, index, realIndex) {
                final img = imgUrl[index];
                return buildImg(img, index);
              },
            ),
            Container(
                padding: const EdgeInsets.only(bottom: 10),
                alignment: Alignment.bottomCenter,
                child: buildIndicator(h, w)),
          ],
        ),
      ),
    );
  }

  Widget buildImg(img, int index) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      //margin: EdgeInsets.symmetric(horizontal: 10),
      child: Image.asset(
        img.toString(),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildIndicator(double h, double w) {
    return AnimatedSmoothIndicator(
        effect: ColorTransitionEffect(
            dotHeight: h * 0.003,
            dotWidth: w * 0.06,
            dotColor: Colors.grey,
            activeDotColor: Colors.white),
        activeIndex: _activeIndex,
        count: imgUrl.length);
  }
}
