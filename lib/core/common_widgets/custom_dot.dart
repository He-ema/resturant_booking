import 'package:flutter/widgets.dart';
import 'package:jobizz/constants.dart';

class CustomDot extends StatelessWidget {
  const CustomDot({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 8,
      height: 8,
      decoration: ShapeDecoration(
        color: isActive ? kPrimaryColor : const Color(0xffE6E6E6),
        shape: const OvalBorder(),
      ),
    );
  }
}
