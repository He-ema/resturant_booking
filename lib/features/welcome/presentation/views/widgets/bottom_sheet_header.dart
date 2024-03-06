import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobizz/features/welcome/presentation/managers/cubit/bottom_sheet_cubit.dart';
import 'package:jobizz/features/welcome/presentation/views/widgets/sheet_tab_widget.dart';

class BottomSheetheader extends StatefulWidget {
  const BottomSheetheader({
    super.key,
  });

  @override
  State<BottomSheetheader> createState() => _BottomSheetheaderState();
}

class _BottomSheetheaderState extends State<BottomSheetheader> {
  final items = [
    'Create Account',
    'Login',
  ];
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: items
          .asMap()
          .entries
          .map((e) => GestureDetector(
              onTap: () {
                if (activeIndex != e.key) {
                  activeIndex = e.key;
                  BlocProvider.of<BottomSheetCubit>(context)
                      .changeCurrentIndex = activeIndex;
                  print(BlocProvider.of<BottomSheetCubit>(context)
                      .getCurrentIndex);
                }
                setState(() {});
              },
              child: SheetTabWidget(
                  text: items[e.key], isActive: activeIndex == e.key)))
          .toList(),
    );
  }
}