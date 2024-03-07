import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobizz/constants.dart';
import 'package:jobizz/core/common_widgets/dots_indicator.dart';
import 'package:jobizz/core/utils/app_router.dart';
import 'package:jobizz/core/utils/app_styles.dart';
import 'package:jobizz/features/onBoarding/presentation/views/widgets/on_boarding_page_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  int currentInedx = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      currentInedx = pageController.page!.round();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: OnBoardingPageView(pageController: pageController),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).pushReplacement(AppRouter.welcomeRoute);
                },
                child: const Text(
                  'Skip',
                  style: AppStyles.styleRegular16,
                ),
              ),
            ),
            DotsIndicator(activeIndex: currentInedx),
            IconButton(
              onPressed: () {
                if (pageController.page == 2) {
                  GoRouter.of(context).pushReplacement(AppRouter.welcomeRoute);
                } else {
                  pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                }
              },
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
