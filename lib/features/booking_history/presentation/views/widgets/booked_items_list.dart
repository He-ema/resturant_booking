import 'package:flutter/material.dart';
import 'package:jobizz/features/booking_history/presentation/managers/cubit/booked_resturant_cubit.dart';
import 'package:jobizz/features/booking_history/presentation/views/widgets/booked_resturant_item.dart';

class BookedItemsList extends StatelessWidget {
  const BookedItemsList({
    super.key,
    required this.state,
  });

  final BookedResturantSuccess state;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemCount: state.bookedResturantList.length,
        itemBuilder: (context, index) => BookedResturantItem(
              productModel: state.bookedResturantList[index],
            ));
  }
}
