import 'package:flutter/material.dart';
import 'package:jobizz/core/utils/app_styles.dart';

class TrendingHeader extends StatelessWidget {
  const TrendingHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Trending', style: AppStyles.styleSemiBold16),
            Text('Best of this week', style: AppStyles.styleMedium12),
          ],
        ),
        Column(
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
