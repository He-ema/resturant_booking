import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jobizz/constants.dart';
import 'package:jobizz/core/common_widgets/custom_button.dart';
import 'package:jobizz/core/utils/app_styles.dart';
import 'package:jobizz/features/home/data/models/product_model/product_model.dart';
import 'package:jobizz/features/home/presentation/managers/product_cubit/product_cubit.dart';
import 'package:jobizz/features/home/presentation/views/widgets/nearby_image.dart';
import 'package:jobizz/features/home/presentation/views/widgets/nearby_location.dart';
import 'package:jobizz/features/home/presentation/views/widgets/resturant_details_view.dart';

class NearbyResturantItem extends StatefulWidget {
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
  State<NearbyResturantItem> createState() => _NearbyResturantItemState();
}

class _NearbyResturantItemState extends State<NearbyResturantItem> {
  bool isLoading = false;
  bool exist = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.isDetails) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => ResturantDetailsView(
                  productModel: widget.productModel,
                  state: widget.state,
                  type: 1),
            ),
          );
        } else {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ResturantDetailsView(
                productModel: widget.productModel,
                state: widget.state,
                type: 2),
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
                    productModel: widget.productModel,
                    isDetails: widget.isDetails,
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
                          widget.productModel.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.styleSemiBold16,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: NearbyLocation(
                                  productModel: widget.productModel),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Expanded(
                              flex: 3,
                              child: SizedBox(
                                height: 40,
                                child: CustomButton(
                                  text: exist ? 'Cancel' : 'Book',
                                  isLoading: isLoading,
                                  onPressed: () async {
                                    await handleAddingAndDeletionOfItem();
                                  },
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

  Future<void> checkExistence() async {
    isLoading = true;
    setState(() {});
    CollectionReference booked =
        FirebaseFirestore.instance.collection(kBookCollectionReference);
    await booked.doc(widget.productModel.name).get().then((value) {
      if (value.exists) {
        exist = true;
      } else {
        exist = false;
      }
    });
    isLoading = false;
    setState(() {});
  }

  Future<void> handleAddingAndDeletionOfItem() async {
    isLoading = true;
    setState(() {});
    CollectionReference booked =
        FirebaseFirestore.instance.collection(kBookCollectionReference);
    await booked.doc(widget.productModel.name).get().then((value) {
      if (value.exists) {
        booked.doc(widget.productModel.name).delete();
        checkExistence();
        exist = false;
      } else {
        booked.doc(widget.productModel.name).set({
          kResturantName: widget.productModel.name,
          kResturantImage: widget.productModel.mainPhoto!.source,
          kResturantAddress:
              '${widget.productModel.address.country},${widget.productModel.address.locality},${widget.productModel.address.street}',
        });
        checkExistence();
        exist = true;
      }
    });
    isLoading = false;
    setState(() {});
  }
}
