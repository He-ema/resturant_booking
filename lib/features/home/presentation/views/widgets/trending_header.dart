import 'package:flutter/material.dart';
import 'package:jobizz/core/utils/app_styles.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppStyles.styleSemiBold16),
            Text(subtitle, style: AppStyles.styleMedium12),
          ],
        ),
        const Column(
          children: [
            Text(
              'See all >',
              style: AppStyles.styleMedium12,
            ),
          ],
        )
      ],
    );
  }
}
