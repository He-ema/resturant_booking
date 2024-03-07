import 'package:flutter/material.dart';
import 'package:jobizz/core/common_widgets/custom_button.dart';
import 'package:jobizz/core/utils/app_styles.dart';
import 'package:jobizz/core/utils/assets.dart';
import 'package:jobizz/features/welcome/presentation/views/widgets/custom_text_form_field.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Full Name',
            style: AppStyles.styleSemiBold14,
          ),
          const SizedBox(
            height: 8,
          ),
          CustomTextFormField(
            hint: 'Enter your full name',
            controller: _nameController,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Email address',
            style: AppStyles.styleSemiBold14,
          ),
          const SizedBox(
            height: 8,
          ),
          CustomTextFormField(
            hint: 'Eg namaemail@emailkamu.com',
            controller: _emailController,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Password',
            style: AppStyles.styleSemiBold14,
          ),
          const SizedBox(
            height: 8,
          ),
          CustomTextFormField(
            hint: '**** **** ****',
            controller: _passwordController,
          ),
          const SizedBox(
            height: 35,
          ),
          CustomButton(
            text: 'Registeration',
            onPressed: () {
              if (formKey.currentState!.validate()) {
              } else {
                autovalidateMode = AutovalidateMode.always;
              }
            },
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
            height: 36,
          ),
        ],
      ),
    );
  }
}
