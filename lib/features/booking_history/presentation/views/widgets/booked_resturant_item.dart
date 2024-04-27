import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jobizz/constants.dart';
import 'package:jobizz/core/common_widgets/custom_button.dart';
import 'package:jobizz/core/utils/app_styles.dart';
import 'package:jobizz/features/booking_history/data/models/booked_resturant_model.dart';
import 'package:jobizz/features/booking_history/presentation/managers/cubit/booked_resturant_cubit.dart';
import 'package:jobizz/features/booking_history/presentation/views/widgets/booked_resturant_item_address.dart';
import 'package:jobizz/features/booking_history/presentation/views/widgets/booked_resturant_item_image.dart';

class BookedResturantItem extends StatefulWidget {
  const BookedResturantItem({
    super.key,
    required this.productModel,
    required this.index,
    required this.state,
    required this.listKey,
  });
  final BookedResturantModel productModel;
  final int index;
  final BookedResturantSuccess state;
  final GlobalKey<AnimatedListState> listKey;
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
                child: BookedResturantItemImage(widget: widget),
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
                            child: BookedResturantItemAddress(widget: widget),
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
                                  deleteListItem(
                                      widget.index, context, widget.state);
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

  Future<void> deleteListItem(
    int index,
    BuildContext context,
    BookedResturantSuccess state,
  ) async {
    state.bookedResturantList.removeAt(index);
    widget.listKey.currentState!.removeItem(
      index,
      (context, animation) {
        return SlideTransition(
          position: animation.drive(
            Tween(begin: const Offset(2, 0.0), end: const Offset(0.0, 0.0))
                .chain(
              CurveTween(curve: Curves.elasticInOut),
            ),
          ),
          // sizeFactor: animation,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.5),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Center(child: Text('Deleted')),
            ),
          ),
        );
      },
      duration: const Duration(milliseconds: 2000),
    );
  }
}
