import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jobizz/constants.dart';
import 'package:jobizz/core/common_widgets/custom_button.dart';
import 'package:jobizz/core/utils/app_router.dart';
import 'package:jobizz/core/utils/app_styles.dart';
import 'package:jobizz/core/utils/assets.dart';
import 'package:jobizz/core/utils/functions/show_awesome_dialouge.dart';
import 'package:jobizz/features/welcome/presentation/managers/auth_cubit/auth_cubit.dart';
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

  bool isLoadingEmail = false;
  bool isLoadingGoogle = false;
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
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          isLoadingEmail = false;
          isLoadingGoogle = false;

          setState(() {});
          navigateToTheNextRegisterationPage(context);
        } else if (state is AuthFailure) {
          isLoadingEmail = false;
          isLoadingGoogle = false;
          setState(() {});
          showAwesomeDialoug(
              context: context,
              messageHedaer: state.erroHeader,
              messageBody: state.errorMessage);
        }
      },
      child: Form(
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
              isPassword: true,
            ),
            const SizedBox(
              height: 35,
            ),
            CustomButton(
              isLoading: isLoadingEmail,
              text: 'Registeration',
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  await confirmRegisterationWithEmail(context);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
            Divider(
              height: 16,
              indent: MediaQuery.sizeOf(context).width * 0.3,
              endIndent: MediaQuery.sizeOf(context).width * 0.3,
            ),
            CustomButton(
              isLoading: isLoadingGoogle,
              circularProgressIndicatorColor: kPrimaryColor,
              text: 'Sign Up with google',
              textColor: const Color(0xff222222),
              image: Assets.imagesIcGoogle,
              color: const Color(0xffF4F4F4),
              onPressed: () async {
                isLoadingGoogle = true;
                setState(() {});
                await BlocProvider.of<AuthCubit>(context).signInWithGoogle();
              },
            ),
            const SizedBox(
              height: 36,
            ),
          ],
        ),
      ),
    );
  }

  void navigateToTheNextRegisterationPage(BuildContext context) {
    if (BlocProvider.of<AuthCubit>(context).signedWithGoogle) {
      GoRouter.of(context).push(AppRouter.successRoute);
    } else {
      GoRouter.of(context).push(AppRouter.otpRoute);
    }
  }

  Future<void> confirmRegisterationWithEmail(BuildContext context) async {
    isLoadingEmail = true;
    setState(() {});
    await BlocProvider.of<AuthCubit>(context).signUpwithEmail(
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text);
  }
}
