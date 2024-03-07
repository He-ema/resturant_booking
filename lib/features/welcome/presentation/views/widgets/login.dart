import 'package:flutter/material.dart';
import 'package:jobizz/core/common_widgets/custom_button.dart';
import 'package:jobizz/core/utils/app_styles.dart';
import 'package:jobizz/core/utils/assets.dart';
import 'package:jobizz/features/welcome/presentation/views/widgets/custom_text_form_field.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Email address',
          style: AppStyles.styleSemiBold14,
        ),
        const SizedBox(
          height: 8,
        ),
        const CustomTextFormField(hint: 'Eg namaemail@emailkamu.com'),
        const Text(
          'Password',
          style: AppStyles.styleSemiBold14,
        ),
        const SizedBox(
          height: 8,
        ),
        const CustomTextFormField(hint: '**** **** ****'),
        const SizedBox(
          height: 35,
        ),
        CustomButton(
          text: 'Registeration',
          onPressed: () {},
        ),
        Divider(
          height: 16,
          indent: MediaQuery.sizeOf(context).width * 0.3,
          endIndent: MediaQuery.sizeOf(context).width * 0.3,
        ),
        CustomButton(
          text: 'Sign Up with google',
          textColor: const Color(0xff222222),
          image: Assets.imagesIcGoogle,
          color: const Color(0xffF4F4F4),
          onPressed: () {},
        ),
        const SizedBox(
          height: 36 + 92,
          // height: 36,
        ),
      ],
    );
  }
}
