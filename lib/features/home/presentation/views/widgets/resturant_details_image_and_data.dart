import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jobizz/constants.dart';
import 'package:jobizz/core/common_widgets/custom_button.dart';
import 'package:jobizz/core/utils/app_styles.dart';
import 'package:jobizz/features/home/data/models/product_model/product_model.dart';

class ResturantDetailsImageAndData extends StatelessWidget {
  const ResturantDetailsImageAndData(
      {super.key, required this.productModel, required this.type});
  final ProductModel productModel;
  final int type;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(18),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productModel.name,
              style: AppStyles.styleSemiBold20,
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
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
                    '${productModel.address.country},${productModel.address.locality},${productModel.address.street}',
                    style: AppStyles.styleMedium12,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Hero(
              tag: type == 1
                  ? 'null'
                  : productModel.name.toString() + type.toString(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  placeholder: (context, url) =>
                      const SpinKitSpinningLines(color: kPrimaryColor),
                  imageUrl: productModel.mainPhoto?.source ??
                      'https://res.cloudinary.com/tf-lab/image/upload/restaurant/a356d110-e32c-4ed8-9342-83c7e94322a6/05d9f8ed-cb1b-45e0-9295-0cbfde6b31dd.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.access_time_filled,
                          color: kPrimaryColor,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'Open Today',
                          style: AppStyles.styleRegular12,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('10:00 AM - 12:00 PM',
                        style: AppStyles.styleSemiBold12
                            .copyWith(color: Colors.black)),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.directions, color: Colors.blue),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      'Visit the Resturant',
                      style: AppStyles.styleSemiBold12.copyWith(
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                width: MediaQuery.sizeOf(context).width * 0.5,
                child: CustomButton(
                  text: 'Book',
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
