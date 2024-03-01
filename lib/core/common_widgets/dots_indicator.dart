import 'package:flutter/widgets.dart';
import 'package:jobizz/core/common_widgets/custom_dot.dart';

class DotsIndicator extends StatelessWidget {
  const DotsIndicator({super.key, required this.activeIndex});
  final int activeIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        3,
        (index) => Padding(
          padding: const EdgeInsets.only(left: 8),
          child: CustomDot(isActive: index == activeIndex),
        ),
      ),
    );
  }
}
