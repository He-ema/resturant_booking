import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobizz/features/welcome/presentation/managers/cubit/bottom_sheet_cubit.dart';
import 'package:jobizz/features/welcome/presentation/views/widgets/bottom_sheet_header.dart';

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
          decoration: const ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(36),
                topRight: Radius.circular(36),
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                child: BottomSheetheader(),
              ),
              BlocProvider.of<BottomSheetCubit>(context).getCurrentIndex == 0
                  ? Text(BlocProvider.of<BottomSheetCubit>(context)
                      .getCurrentIndex
                      .toString())
                  : Text(BlocProvider.of<BottomSheetCubit>(context)
                      .getCurrentIndex
                      .toString()),
            ],
          ),
        );
      },
    );
  }
}
