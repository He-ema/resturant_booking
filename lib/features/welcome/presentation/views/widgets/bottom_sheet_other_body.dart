import 'package:flutter/material.dart';
import 'package:jobizz/features/welcome/presentation/views/widgets/create_account.dart';
import 'package:jobizz/features/welcome/presentation/views/widgets/login.dart';

class BottomSheetOtherBody extends StatelessWidget {
  const BottomSheetOtherBody({Key? key, required this.index}) : super(key: key);

  final int index;

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
      child: index == 0 ? const CreateAccount() : const Login(),
    );
  }
}
