import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobizz/constants.dart';
import 'package:jobizz/core/common_widgets/custom_button.dart';
import 'package:jobizz/core/common_widgets/custom_icon.dart';
import 'package:jobizz/core/utils/app_router.dart';
import 'package:jobizz/core/utils/app_styles.dart';
import 'package:jobizz/features/OTP/presentation/views/widgets/OTP_field.dart';

class OTPViewBody extends StatefulWidget {
  const OTPViewBody({super.key});

  @override
  State<OTPViewBody> createState() => _OTPViewBodyState();
}

class _OTPViewBodyState extends State<OTPViewBody> {
  bool isFalse = false;
  bool isLoading = false;
  EmailOTP myAuth = EmailOTP();
  String OTPValue = '1234';
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeOTP();
    myAuth.sendOTP();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const CustomIcon(),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Verify Your account',
                  style: AppStyles.styleBold20,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'A verification code sent to your email , plesae check your inbox',
                  style: AppStyles.styleMedium16,
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OTPField(
                      controller: _controller,
                      isFalse: isFalse,
                      onSaved: (p0) {},
                      onChanged: (value) async {
                        if (value.length == 1) {
                          OTPValue = OTPValue.replaceRange(0, 1, value);
                          FocusScope.of(context).nextFocus();
                          await verify();
                        }
                      },
                    ),
                    OTPField(
                      controller: _controller2,
                      isFalse: isFalse,
                      onSaved: (p0) {},
                      onChanged: (value) async {
                        if (value.length == 1) {
                          OTPValue = OTPValue.replaceRange(1, 2, value);
                          FocusScope.of(context).nextFocus();
                          await verify();
                        }
                      },
                    ),
                    OTPField(
                      controller: _controller3,
                      isFalse: isFalse,
                      onSaved: (p0) {},
                      onChanged: (value) async {
                        if (value.length == 1) {
                          OTPValue = OTPValue.replaceRange(2, 3, value);
                          FocusScope.of(context).nextFocus();
                          await verify();
                        }
                      },
                    ),
                    OTPField(
                      controller: _controller4,
                      isFalse: isFalse,
                      onSaved: (p0) {},
                      onChanged: (value) async {
                        if (value.length == 1) {
                          OTPValue = OTPValue.replaceRange(3, 4, value);
                          FocusScope.of(context).nextFocus();
                          await verify();
                        }
                      },
                    ),
                  ],
                ),
                const Expanded(child: SizedBox()),
                CustomButton(
                  isLoading: isLoading,
                  text: 'Resend Code',
                  onPressed: () async {
                    isLoading = true;
                    setState(() {});
                    await myAuth.sendOTP();
                    isLoading = false;
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> verify() async {
    if (_controller.text != '' &&
        _controller2.text != '' &&
        _controller3.text != '' &&
        _controller4.text != '') {
      if (await myAuth.verifyOTP(otp: OTPValue) == true) {
        final CollectionReference users =
            FirebaseFirestore.instance.collection(kUsersCollectionReference);
        users.doc(FirebaseAuth.instance.currentUser!.email).update({
          kVerified: true,
        });
        GoRouter.of(context).push(AppRouter.bottomNavBarRoute);
      } else {
        _controller.clear();
        _controller2.clear();
        _controller3.clear();
        _controller4.clear();
        isFalse = true;
        setState(() {});
      }
    }
  }

  void initializeOTP() {
    myAuth.setTheme(
      theme: "v3",
    );
    myAuth.setConfig(
      appEmail: "resturant_booking@gmail.com",
      appName: "Resturant Booking",
      userEmail: FirebaseAuth.instance.currentUser!.email,
      otpLength: 4,
      otpType: OTPType.digitsOnly,
    );
  }
}
