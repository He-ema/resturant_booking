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

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoadingEmail = false;
  bool isLoadingGoogle = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
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
          navigateToNextPage(context);
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
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
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
                isPassword: true,
                hint: '**** **** ****',
                controller: _passwordController),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Forgot password ?',
                  style:
                      AppStyles.styleSemiBold12.copyWith(color: kPrimaryColor),
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            CustomButton(
              isLoading: isLoadingEmail,
              text: 'Login',
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  await confirmLoginWithEmail(context);
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
              text: 'Login with google',
              textColor: const Color(0xff222222),
              image: Assets.imagesIcGoogle,
              color: const Color(0xffF4F4F4),
              onPressed: () async {
                setState(() {
                  isLoadingGoogle = true;
                });
                await BlocProvider.of<AuthCubit>(context).signInWithGoogle();
              },
            ),
            const SizedBox(
              // height: 36 + 92,
              height: 36,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> confirmLoginWithEmail(BuildContext context) async {
    setState(() {
      isLoadingEmail = true;
    });
    await BlocProvider.of<AuthCubit>(context).loginWithEmailAndPassword(
        email: _emailController.text, password: _passwordController.text);
  }

  void navigateToNextPage(BuildContext context) {
    if (BlocProvider.of<AuthCubit>(context).verified) {
      GoRouter.of(context).push(AppRouter.bottomNavBarRoute);
    } else {
      GoRouter.of(context).push(AppRouter.otpRoute);
    }
  }
}
