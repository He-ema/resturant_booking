import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobizz/core/common_widgets/custom_button.dart';
import 'package:jobizz/core/utils/app_styles.dart';
import 'package:jobizz/core/utils/assets.dart';
import 'package:jobizz/features/welcome/presentation/managers/auth_cubit/auth_cubit.dart';
import 'package:jobizz/features/welcome/presentation/managers/sheet_cubit/bottom_sheet_cubit.dart';
import 'package:jobizz/features/welcome/presentation/views/widgets/welcome_buttom_sheet_body.dart';

class WelcomeViewBody extends StatelessWidget {
  const WelcomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    flex: 3, child: SvgPicture.asset(Assets.imagesWelcome)),
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
                  child: CustomButton(
                    text: 'Create account',
                    onPressed: () {
                      BlocProvider.of<BottomSheetCubit>(context)
                          .changeCurrentIndex = 0;
                      showTheWelcomeSheet(context);
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width - 120,
                  child: CustomButton(
                    text: 'Login',
                    color: const Color(0xffD1FAE5),
                    textColor: const Color(0xff10B981),
                    onPressed: () {
                      BlocProvider.of<BottomSheetCubit>(context)
                          .changeCurrentIndex = 1;

                      showTheWelcomeSheet(context);
                    },
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
        ),
      ],
    );
  }

  Future<dynamic> showTheWelcomeSheet(BuildContext context) {
    return showModalBottomSheet(
      enableDrag: true,
      backgroundColor: Colors.white,
      isDismissible: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(36),
          topRight: Radius.circular(36),
        ),
      ),
      context: context,
      builder: (context) => BlocProvider(
        create: (context) => BottomSheetCubit(),
        child: BlocProvider(
          create: (context) => AuthCubit(),
          child: const WelcomeButtomSheetBody(),
        ),
      ),
    );
  }
}
