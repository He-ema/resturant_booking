import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:jobizz/constants.dart';
import 'package:jobizz/core/utils/app_styles.dart';
import 'package:jobizz/features/home/data/models/product_model/product_model.dart';
import 'package:jobizz/features/home/presentation/managers/product_cubit/product_cubit.dart';
import 'package:jobizz/features/home/presentation/views/widgets/nearby_resturant_item.dart';
import 'package:jobizz/features/home/presentation/views/widgets/resturant_details_image_and_data.dart';
import 'package:jobizz/features/home/presentation/views/widgets/trending_header.dart';

class ResturantDetailsViewBody extends StatelessWidget {
  const ResturantDetailsViewBody(
      {super.key,
      required this.productModel,
      required this.state,
      required this.type});
  final ProductModel productModel;
  final ProductSuccess state;
  final int type;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: kPrimaryColor,
          automaticallyImplyLeading: false,
          pinned: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          )),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              GoRouter.of(context).pop();
            },
          ),
          centerTitle: true,
          surfaceTintColor: const Color(0xfff6f6f6),
          title: Text(
            'Resturant Details',
            style: AppStyles.styleSemiBold16.copyWith(color: Colors.white),
          ),
        ),
        ResturantDetailsImageAndData(
          productModel: productModel,
          type: type,
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
          itemBuilder: (context, index) => NearbyResturantItem(
            productModel: state.products[index],
            state: state,
            isDetails: true,
          ),
        ),
      ],
    );
  }
}
