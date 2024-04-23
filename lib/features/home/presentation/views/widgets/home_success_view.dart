import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobizz/features/home/presentation/managers/product_cubit/product_cubit.dart';
import 'package:jobizz/features/home/presentation/views/widgets/carousel_and_dots.dart';
import 'package:jobizz/features/home/presentation/views/widgets/custom_header.dart';
import 'package:jobizz/features/home/presentation/views/widgets/nearby_resturant_item.dart';
import 'package:jobizz/features/home/presentation/views/widgets/trending_header.dart';
import 'package:jobizz/features/home/presentation/views/widgets/trending_section.dart';

class HomeSuccessView extends StatelessWidget {
  const HomeSuccessView({
    super.key,
    required this.state,
  });
  final ProductSuccess state;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
                systemNavigationBarColor: Colors.black,
                statusBarColor: Colors.transparent),
            backgroundColor: Color(0xfff6f6f6),
            automaticallyImplyLeading: false,
            pinned: true,
            expandedHeight: 110,
            collapsedHeight: 110,
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
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 16),
              child: Column(
                children: [
                  SectionHeader(
                    subtitle: 'Book nearby resturants',
                    title: 'Book Resturant',
                  ),
                ],
              ),
            ),
          ),
          SliverList.builder(
            itemCount: state.products.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: NearbyResturantItem(
                productModel: state.products[index],
              ),
            ),
          )
        ],
      ),
    );
  }
}
