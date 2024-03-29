import 'package:flutter/material.dart';
import 'package:jobizz/constants.dart';
import 'package:jobizz/core/utils/app_styles.dart';
import 'package:jobizz/features/home/data/models/product_model/product_model.dart';

class TrendingItemContainer extends StatelessWidget {
  const TrendingItemContainer({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.4,
      child: AspectRatio(
        aspectRatio: 148 / 196,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            product.mainPhoto?.source ??
                                'https://res.cloudinary.com/tf-lab/image/upload/restaurant/a356d110-e32c-4ed8-9342-83c7e94322a6/05d9f8ed-cb1b-45e0-9295-0cbfde6b31dd.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Product name',
                style: AppStyles.styleSemiBold16,
              ),
              const SizedBox(
                height: 4,
              ),
              const Expanded(
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: kPrimaryColor,
                      size: 15,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Text(
                        'App location 1 , app location 2',
                        style: AppStyles.styleMedium12,
                        // overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
