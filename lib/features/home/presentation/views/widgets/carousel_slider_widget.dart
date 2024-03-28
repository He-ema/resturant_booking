import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jobizz/core/utils/assets.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({super.key, this.changeDots});
  final Function? changeDots;

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  final myImages = [
    Image.asset(Assets.imagesCarousel1),
    Image.asset(Assets.imagesCarousel2),
    Image.asset(Assets.imagesCarousel3),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: myImages,
        options: CarouselOptions(
          viewportFraction: 0.7,
          autoPlay: true,
          enlargeCenterPage: true,
          height: 130,
          autoPlayCurve: Curves.easeInOut,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayInterval: const Duration(seconds: 2),
          enableInfiniteScroll: true,
          aspectRatio: 280 / 120,
          onPageChanged: (index, reason) {
            widget.changeDots!(index);
            setState(() {});
            currentIndex = index;
          },
        ));
  }
}
