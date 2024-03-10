import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jobizz/core/common_widgets/custom_button.dart';
import 'package:jobizz/core/common_widgets/custom_icon.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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

    myAuth.sendOTP();
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
                      onSaved: (value) {},
                      onChanged: (value) {},
                      isFalse: isFalse,
                    ),
                    OTPField(
                      onSaved: (value) {},
                      onChanged: (value) {},
                      isFalse: isFalse,
                    ),
                    OTPField(
                      onSaved: (value) {},
                      onChanged: (value) {},
                      isFalse: isFalse,
                    ),
                    OTPField(
                      onSaved: (value) {},
                      onChanged: (value) {},
                      isFalse: isFalse,
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
}
