import 'package:flutter/material.dart';
import 'package:jobizz/constants.dart';
import 'package:jobizz/core/utils/app_styles.dart';
import 'package:jobizz/features/home/data/models/product_model/product_model.dart';

class NearbyLocation extends StatelessWidget {
  const NearbyLocation({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.location_on,
          color: kPrimaryColor,
          size: 15,
        ),
        const SizedBox(
          width: 4,
        ),
        Expanded(
          child: Text(
            '${productModel.address.country} ${productModel.address.locality} ${productModel.address.street}',
            style: AppStyles.styleMedium12,
          ),
        ),
      ],
    );
  }
}
