import 'package:flutter/material.dart';
import 'package:jobizz/features/OTP/presentation/views/widgets/OTP_field.dart';

class OTPViewBody extends StatefulWidget {
  const OTPViewBody({super.key});

  @override
  State<OTPViewBody> createState() => _OTPViewBodyState();
}

class _OTPViewBodyState extends State<OTPViewBody> {
  bool isFalse = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
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
        ],
      ),
    );
  }
}
