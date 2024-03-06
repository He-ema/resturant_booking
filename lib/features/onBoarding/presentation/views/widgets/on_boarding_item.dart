import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobizz/core/utils/app_styles.dart';
import 'package:jobizz/features/onBoarding/data/models/on_boarding_model.dart';

class OnBoradingItem extends StatelessWidget {
  const OnBoradingItem({super.key, required this.onBoardingModel});
  final OnBoardingModel onBoardingModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 6,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SvgPicture.asset(
              onBoardingModel.image,
            ),
          ]),
        ),
        // const SizedBox(
        //   height: 80,
        // ),
        Expanded(
          child: Text(
            onBoardingModel.title,
            style: AppStyles.styleSemiBold24,
          ),
        ),
        // const SizedBox(
        //   height: 16,
        // ),
        Expanded(
          child: Text(
            onBoardingModel.subtitle,
            textAlign: TextAlign.center,
            style: AppStyles.styleRegular12,
          ),
        ),
      ],
    );
  }
}
