import 'package:flutter/material.dart';
import 'package:jobizz/features/home/presentation/managers/product_cubit/product_cubit.dart';
import 'package:jobizz/features/home/presentation/views/widgets/carousel_and_dots.dart';
import 'package:jobizz/features/home/presentation/views/widgets/custom_header.dart';
import 'package:jobizz/features/home/presentation/views/widgets/trending_section.dart';

class HomeSuccessView extends StatelessWidget {
  const HomeSuccessView({
    super.key,
    required this.state,
  });
  final ProductSuccess state;

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
        TrendingSection(
          state: state,
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
