import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobizz/features/OTP/presentation/views/widgets/OTP_view_body.dart';
import 'package:jobizz/features/welcome/presentation/managers/auth_cubit/auth_cubit.dart';

class OTPView extends StatelessWidget {
  const OTPView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: OTPViewBody(),
    );
  }
}
