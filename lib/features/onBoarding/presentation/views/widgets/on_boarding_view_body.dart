import 'package:flutter/material.dart';
import 'package:jobizz/constants.dart';
import 'package:jobizz/core/common_widgets/dots_indicator.dart';
import 'package:jobizz/core/utils/app_styles.dart';
import 'package:jobizz/features/onBoarding/presentation/views/widgets/on_boarding_page_view.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          child: OnBoardingPageView(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Skip',
              style: AppStyles.styleRegular16,
            ),
            const DotsIndicator(activeIndex: 0),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward, color: kPrimaryColor),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
