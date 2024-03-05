import 'package:flutter/material.dart';
import 'package:jobizz/constants.dart';
import 'package:jobizz/core/utils/app_styles.dart';

class SheetTabWidget extends StatelessWidget {
  const SheetTabWidget({super.key, required this.text, required this.isActive});
  final String text;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: AppStyles.styleSemiBold16.copyWith(
              color: isActive ? kPrimaryColor : const Color(0xff89909E),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          isActive
              ? Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  height: 1,
                  color: kPrimaryColor,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
