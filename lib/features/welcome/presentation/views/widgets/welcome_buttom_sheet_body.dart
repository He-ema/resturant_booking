import 'package:flutter/material.dart';
import 'package:jobizz/constants.dart';
import 'package:jobizz/core/utils/app_styles.dart';
import 'package:jobizz/features/welcome/presentation/views/widgets/sheet_tab_widget.dart';

class WelcomeButtomSheetBody extends StatelessWidget {
  const WelcomeButtomSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 38,
            child: Row(
              children: [
                SheetTabWidget(text: 'Create Account', isActive: true),
                SheetTabWidget(text: 'Login', isActive: true),
              ],
            ),
          ),
          SizedBox(),
        ],
      ),
    );
  }
}
