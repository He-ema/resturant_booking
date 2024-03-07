import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobizz/constants.dart';
import 'package:jobizz/features/welcome/presentation/managers/sheet_cubit/bottom_sheet_cubit.dart';
import 'package:jobizz/features/welcome/presentation/views/widgets/bottom_sheet_header.dart';
import 'package:jobizz/features/welcome/presentation/views/widgets/bottom_sheet_other_body.dart';

class WelcomeButtomSheetBody extends StatefulWidget {
  const WelcomeButtomSheetBody({super.key});

  @override
  State<WelcomeButtomSheetBody> createState() => _WelcomeButtomSheetBodyState();
}

class _WelcomeButtomSheetBodyState extends State<WelcomeButtomSheetBody> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomSheetCubit, BottomSheetState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          decoration: const ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(36),
                topRight: Radius.circular(36),
              ),
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.viewInsetsOf(context).bottom),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.1,
                    height: 4,
                    color: kPrimaryColor,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const BottomSheetheader(),
                  const SizedBox(
                    height: 36,
                  ),
                  BottomSheetOtherBody(
                      index: BlocProvider.of<BottomSheetCubit>(context)
                          .getCurrentIndex),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
