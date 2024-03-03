import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobizz/core/common_widgets/custom_button.dart';
import 'package:jobizz/core/utils/app_styles.dart';
import 'package:jobizz/core/utils/assets.dart';

class WelcomeViewBody extends StatelessWidget {
  const WelcomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 3, child: SvgPicture.asset(Assets.imagesWelcome)),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome',
                          style: AppStyles.styleSemiBold24,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width - 120,
                      child: const Text(
                        'Before enjoying Foodmedia services Please register first',
                        textAlign: TextAlign.center,
                        style: AppStyles.styleRegular14,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width - 120,
                child: const CustomButton(text: 'Create account'),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width - 120,
                child: const CustomButton(
                  text: 'Login',
                  color: Color(0xffD1FAE5),
                  textColor: Color(0xff10B981),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'By logging in or registering, you have agreed to the Terms and Conditions and Privacy Policy.',
                style: AppStyles.styleRegular10,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
