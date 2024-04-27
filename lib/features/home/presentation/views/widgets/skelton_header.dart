import 'package:flutter/material.dart';
import 'package:jobizz/core/common_widgets/skelton.dart';

class SkeltonHeader extends StatelessWidget {
  const SkeltonHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Skelton(
              width: MediaQuery.sizeOf(context).width * 0.25,
              height: 15,
              opacity: 0.5,
              borderRaduis: 10,
            ),
            const SizedBox(
              height: 5,
            ),
            Skelton(
              width: MediaQuery.sizeOf(context).width * 0.4,
              height: 7,
              opacity: 0.5,
              borderRaduis: 10,
            ),
          ],
        ),
        Skelton(
          width: MediaQuery.sizeOf(context).width * 0.2,
          height: 7,
          opacity: 0.5,
          borderRaduis: 10,
        ),
      ],
    );
  }
}
