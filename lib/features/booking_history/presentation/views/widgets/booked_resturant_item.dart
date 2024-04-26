import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jobizz/constants.dart';
import 'package:jobizz/core/common_widgets/custom_button.dart';
import 'package:jobizz/core/utils/app_styles.dart';
import 'package:jobizz/features/booking_history/data/models/booked_resturant_model.dart';

class BookedResturantItem extends StatefulWidget {
  const BookedResturantItem({
    super.key,
    required this.productModel,
  });
  final BookedResturantModel productModel;
  @override
  State<BookedResturantItem> createState() => _BookedResturantItemState();
}

class _BookedResturantItemState extends State<BookedResturantItem> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: CachedNetworkImage(
                      placeholder: (context, url) =>
                          const SpinKitSpinningLines(color: kPrimaryColor),
                      imageUrl: widget.productModel.image ??
                          'https://res.cloudinary.com/tf-lab/image/upload/restaurant/a356d110-e32c-4ed8-9342-83c7e94322a6/05d9f8ed-cb1b-45e0-9295-0cbfde6b31dd.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
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
                            child: Row(
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
                                    widget.productModel.address,
                                    style: AppStyles.styleMedium12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Expanded(
                            flex: 3,
                            child: SizedBox(
                              height: 40,
                              child: CustomButton(
                                text: 'Cancel',
                                isLoading: isLoading,
                                onPressed: () async {
                                  await cancelBooking();
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
    );
  }

  Future<void> cancelBooking() async {
    isLoading = true;
    if (mounted) {
      setState(() {});
    }
    CollectionReference booked =
        FirebaseFirestore.instance.collection(kBookCollectionReference);

    await booked.doc(widget.productModel.name).delete();
    isLoading = false;
    if (mounted) {
      setState(() {});
    }
  }
}
