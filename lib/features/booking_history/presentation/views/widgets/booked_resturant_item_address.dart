import 'package:flutter/material.dart';
import 'package:jobizz/constants.dart';
import 'package:jobizz/core/utils/app_styles.dart';
import 'package:jobizz/features/booking_history/presentation/views/widgets/booked_resturant_item.dart';

class BookedResturantItemAddress extends StatelessWidget {
  const BookedResturantItemAddress({
    super.key,
    required this.widget,
  });

  final BookedResturantItem widget;

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
            widget.productModel.address,
            style: AppStyles.styleMedium12,
          ),
        ),
      ],
    );
  }
}
