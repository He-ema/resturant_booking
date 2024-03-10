import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: const ShapeDecoration(
        color: Color(0xffF4F4F4),
        shape: OvalBorder(),
      ),
      child: IconButton(
          onPressed: onPressed ??
              () {
                GoRouter.of(context).pop();
              },
          icon: const Icon(
            Icons.arrow_back,
          )),
    );
  }
}
