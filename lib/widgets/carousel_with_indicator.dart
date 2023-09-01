import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: CarouselSlider(
          items: imageSliders,
          carouselController: _controller,
          options: CarouselOptions(
              viewportFraction: 1,
              autoPlay: true,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: kImagesURLs.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 12.0,
              height: 12.0,
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                      .withOpacity(_current == entry.key ? 0.9 : 0.4)),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}

final List<Widget> imageSliders = kImagesURLs
    .map(
      (item) => ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
        child: Stack(
          children: <Widget>[
            Image.network(
              item,
              fit: BoxFit.cover,
              //height: 257,
              //width: 343,
            ),
            // Positioned(
            //   bottom: 0.0,
            //   left: 0.0,
            //   right: 0.0,
            //   child: Container(
            //       // decoration: BoxDecoration(
            //       //   gradient: LinearGradient(
            //       //     colors: [
            //       //       Color.fromARGB(200, 0, 0, 0),
            //       //       Color.fromARGB(0, 0, 0, 0)
            //       //     ],
            //       //     begin: Alignment.bottomCenter,
            //       //     end: Alignment.topCenter,
            //       //   ),
            //       // ),
            //       // padding: EdgeInsets.symmetric(
            //       //     vertical: 10.0, horizontal: 20.0),
            //       // child: Text(
            //       //   'No. ${kImagesURLs.indexOf(item)} image',
            //       //   style: TextStyle(
            //       //     color: Colors.white,
            //       //     fontSize: 20.0,
            //       //     fontWeight: FontWeight.bold,
            //       //   ),
            //       // ),
            //       ),
            // ),
          ],
        ),
      ),
    )
    .toList();
