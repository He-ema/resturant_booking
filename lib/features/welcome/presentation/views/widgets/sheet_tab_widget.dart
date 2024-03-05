import 'package:flutter/material.dart';
import 'package:jobizz/features/welcome/presentation/views/widgets/active_and_in_active_sheet_tab_bar_item.dart';

class SheetTabWidget extends StatelessWidget {
  const SheetTabWidget({Key? key, required this.text, required this.isActive})
      : super(key: key);

  final String text;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(
          scale: Tween<double>(
            begin: 0.5,
            end: 1.0,
          ).animate(animation),
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
      child: isActive
          ? ActiveSheetTabBarItem(
              key: UniqueKey(),
              text: text,
            )
          : InActiveSheetTabBarItem(
              key: UniqueKey(),
              text: text,
            ),
    );
  }
}
