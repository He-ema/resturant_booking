import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobizz/core/utils/app_styles.dart';
import 'package:jobizz/features/onBoarding/presentation/view_models/on_boarding_model.dart';

class OnBoradingItem extends StatelessWidget {
  const OnBoradingItem({super.key, required this.onBoardingModel});
  final OnBoardingModel onBoardingModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            onBoardingModel.image,
            // fit: BoxFit.scaleDown,
          ),
          const SizedBox(
            height: 80,
          ),
          Text(
            onBoardingModel.title,
            style: AppStyles.styleSemiBold24,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            onBoardingModel.subtitle,
            textAlign: TextAlign.center,
            style: AppStyles.styleRegular12,
          ),
        ],
      ),
    );
  }
}
