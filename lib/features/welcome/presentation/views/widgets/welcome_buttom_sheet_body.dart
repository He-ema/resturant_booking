import 'package:flutter/material.dart';
import 'package:jobizz/features/welcome/presentation/views/widgets/bottom_sheet_header.dart';

class WelcomeButtomSheetBody extends StatelessWidget {
  const WelcomeButtomSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 38,
            child: BottomSheetheader(),
          ),
          SizedBox(),
        ],
      ),
    );
  }
}
