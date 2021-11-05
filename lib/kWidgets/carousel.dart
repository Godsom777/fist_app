import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'games.dart';

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: CarouselSlider.builder(
          itemCount: games.length - 10,
          options: CarouselOptions(
            //height: 500,
            aspectRatio: 4 / 9,
            viewportFraction: 1,
            initialPage: 2,
            autoPlay: true,
            scrollDirection: Axis.horizontal,
            enlargeCenterPage: false,
          ),
          itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
              Image(
                image: AssetImage(games[index].image),
                fit: BoxFit.cover,
                width: 1000,
              )),
    );
  }
}
