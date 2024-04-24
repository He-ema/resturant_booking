import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jobizz/constants.dart';
import 'package:jobizz/features/home/data/models/product_model/product_model.dart';

class NearbyImage extends StatelessWidget {
  const NearbyImage({
    super.key,
    required this.productModel,
    required this.isDetails,
  });

  final ProductModel productModel;
  final bool isDetails;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: isDetails ? '${productModel.name}1' : '${productModel.name}2',
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: CachedNetworkImage(
            placeholder: (context, url) =>
                const SpinKitSpinningLines(color: kPrimaryColor),
            imageUrl: productModel.mainPhoto?.source ??
                'https://res.cloudinary.com/tf-lab/image/upload/restaurant/a356d110-e32c-4ed8-9342-83c7e94322a6/05d9f8ed-cb1b-45e0-9295-0cbfde6b31dd.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
