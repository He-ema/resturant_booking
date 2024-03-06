import 'package:flutter/material.dart';
import 'package:jobizz/core/utils/assets.dart';
import 'package:jobizz/features/onBoarding/data/models/on_boarding_model.dart';
import 'package:jobizz/features/onBoarding/presentation/views/widgets/on_boarding_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({
    super.key,
    required this.pageController,
  });
  final PageController pageController;
  static const items = [
    OnBoardingModel(
        image: Assets.imagesOnBoard1,
        title: 'Nearby restaurants',
        subtitle:
            'You don\'t have to go far to find a good restaurant,we have provided all the restaurants that is near you'),
    OnBoardingModel(
        image: Assets.imagesOnBoard2,
        title: 'Select the Favorites Menu',
        subtitle:
            'Now eat well, don\'t leave the house,You can choose your favorite food only with one click'),
    OnBoardingModel(
        image: Assets.imagesOnBoard3,
        title: 'Good food at a cheap price',
        subtitle: 'You can eat at expensive restaurants with affordable price'),
  ];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: items.length,
      itemBuilder: (context, index) => OnBoradingItem(
        onBoardingModel: items[index],
      ),
    );
  }
}
