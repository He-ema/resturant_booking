import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jobizz/constants.dart';
import 'package:jobizz/core/utils/app_styles.dart';
import 'package:jobizz/core/utils/assets.dart';
import 'package:jobizz/features/booking_history/presentation/managers/cubit/booked_resturant_cubit.dart';
import 'package:jobizz/features/booking_history/presentation/views/widgets/booked_resturant_item.dart';
import 'package:lottie/lottie.dart';

class BookedItemsList extends StatefulWidget {
  const BookedItemsList({
    super.key,
    required this.state,
  });

  final BookedResturantSuccess state;

  @override
  State<BookedItemsList> createState() => _BookedItemsListState();
}

class _BookedItemsListState extends State<BookedItemsList> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: widget.state.bookedResturantList.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(Assets.imagesEmptyBook),
                const Text('Empty Booking History',
                    style: AppStyles.styleSemiBold20),
              ],
            )
          : AnimatedList(
              key: _listKey,
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              initialItemCount: widget.state.bookedResturantList.length,
              itemBuilder: (context, index, animation) => BookedResturantItem(
                productModel: widget.state.bookedResturantList[index],
                index: index,
                state: widget.state,
                updateUI: updateUI,
                listKey: _listKey,
              ),
            ),
    );
  }

  void updateUI() {
    setState(() {});
  }
}
