import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jobizz/core/common_widgets/custom_button.dart';
import 'package:jobizz/core/utils/app_styles.dart';
import 'package:jobizz/features/home/data/models/product_model/product_model.dart';
import 'package:jobizz/features/home/presentation/managers/product_cubit/product_cubit.dart';
import 'package:jobizz/features/home/presentation/views/widgets/nearby_image.dart';
import 'package:jobizz/features/home/presentation/views/widgets/nearby_location.dart';
import 'package:jobizz/features/home/presentation/views/widgets/resturant_details_view.dart';

class NearbyResturantItem extends StatelessWidget {
  const NearbyResturantItem({
    super.key,
    required this.productModel,
    this.isDetails = false,
    required this.state,
  });
  final ProductModel productModel;
  final ProductSuccess state;
  final bool isDetails;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isDetails) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => ResturantDetailsView(
                  productModel: productModel, state: state, type: 1),
            ),
          );
        } else {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ResturantDetailsView(
                productModel: productModel, state: state, type: 2),
          ));
        }
      },
      child: AspectRatio(
        aspectRatio: 340 / 100,
        child: Card(
          child: Container(
            padding: const EdgeInsets.all(12),
            width: 200,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Expanded(
                  child: NearbyImage(
                    productModel: productModel,
                    isDetails: isDetails,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productModel.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.styleSemiBold16,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: NearbyLocation(productModel: productModel),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Expanded(
                              flex: 3,
                              child: SizedBox(
                                height: 40,
                                child: CustomButton(
                                  text: 'Book',
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
