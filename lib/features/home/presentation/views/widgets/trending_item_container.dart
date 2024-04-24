import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:jobizz/constants.dart';
import 'package:jobizz/core/utils/app_router.dart';
import 'package:jobizz/core/utils/app_styles.dart';
import 'package:jobizz/features/home/data/models/product_model/product_model.dart';
import 'package:jobizz/features/home/presentation/managers/product_cubit/product_cubit.dart';
import 'package:jobizz/features/home/presentation/views/widgets/resturant_details_view.dart';

class TrendingItemContainer extends StatelessWidget {
  const TrendingItemContainer({
    super.key,
    required this.product,
    required this.state,
  });
  final ProductModel product;
  final ProductSuccess state;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ResturantDetailsView(
              productModel: product, state: state, type: 0),
        ));
      },
      child: Card(
        child: SizedBox(
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
                            child: Hero(
                              tag: '${product.name}0',
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: CachedNetworkImage(
                                  placeholder: (context, url) =>
                                      const SpinKitSpinningLines(
                                          color: kPrimaryColor),
                                  imageUrl: product.mainPhoto?.source ??
                                      'https://res.cloudinary.com/tf-lab/image/upload/restaurant/a356d110-e32c-4ed8-9342-83c7e94322a6/05d9f8ed-cb1b-45e0-9295-0cbfde6b31dd.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.styleSemiBold16,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                          '${product.address.country},${product.address.locality}\n${product.address.street}',
                          style: AppStyles.styleMedium12,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
