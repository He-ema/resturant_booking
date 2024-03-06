import 'package:flutter/material.dart';
import 'package:jobizz/constants.dart';
import 'package:jobizz/core/utils/app_styles.dart';

class ActiveSheetTabBarItem extends StatelessWidget {
  const ActiveSheetTabBarItem({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: AppStyles.styleSemiBold16.copyWith(
                color: kPrimaryColor,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              height: 2,
              color: kPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}

class InActiveSheetTabBarItem extends StatelessWidget {
  const InActiveSheetTabBarItem({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: AppStyles.styleSemiBold16.copyWith(
                color: const Color(0xff89909E),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
          ],
        ),
      ),
    );
  }
}
