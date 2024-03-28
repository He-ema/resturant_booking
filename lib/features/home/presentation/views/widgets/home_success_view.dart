import 'package:flutter/material.dart';
import 'package:jobizz/core/utils/app_styles.dart';
import 'package:jobizz/features/home/presentation/views/widgets/carousel_and_dots.dart';
import 'package:jobizz/features/home/presentation/views/widgets/custom_header.dart';

class HomeSuccessView extends StatelessWidget {
  const HomeSuccessView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          backgroundColor: Color(0xfff6f6f6),
          automaticallyImplyLeading: false,
          pinned: true,
          expandedHeight: 85,
          collapsedHeight: 85,
          surfaceTintColor: Color(0xfff6f6f6),
          flexibleSpace: FlexibleSpaceBar(
            background: CustomHeader(),
          ),
        ),
        const SliverToBoxAdapter(
          child: CarouselAndDots(),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
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
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: List.generate(
              20,
              (index) => Container(
                margin: const EdgeInsets.all(20),
                height: 50,
                width: 50,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
