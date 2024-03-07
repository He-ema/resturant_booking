import 'package:flutter/material.dart';
import 'package:jobizz/features/OTP/presentation/views/widgets/OTP_view_body.dart';

class OTPView extends StatelessWidget {
  const OTPView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OTPViewBody(),
    );
  }
}
