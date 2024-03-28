import 'package:flutter/material.dart';
import 'package:jobizz/features/home/presentation/views/widgets/trending_header.dart';
import 'package:jobizz/features/home/presentation/views/widgets/trending_item_container.dart';

import '../../managers/product_cubit/product_cubit.dart';

class TrendingSection extends StatelessWidget {
  const TrendingSection({
    super.key,
    required this.state,
  });
  final ProductSuccess state;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const TrendingHeader(),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: (MediaQuery.sizeOf(context).width * 0.4 * 196) / 148,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: TrendingItemContainer(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
