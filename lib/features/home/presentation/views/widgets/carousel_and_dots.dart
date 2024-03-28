import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jobizz/core/common_widgets/dots_indicator.dart';
import 'package:jobizz/features/home/presentation/views/widgets/carousel_slider_widget.dart';

class CarouselAndDots extends StatefulWidget {
  const CarouselAndDots({super.key});

  @override
  State<CarouselAndDots> createState() => _CarouselAndDotsState();
}

class _CarouselAndDotsState extends State<CarouselAndDots> {
  @override
  late CarouselController carouselController;
  int activeIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void changeDots(int currentIndex) {
    activeIndex = currentIndex;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CarouselSliderWidget(changeDots: changeDots),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DotsIndicator(activeIndex: activeIndex),
          ],
        ),
      ],
    );
  }
}
