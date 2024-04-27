import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jobizz/constants.dart';
import 'package:jobizz/features/booking_history/presentation/views/widgets/booked_resturant_item.dart';

class BookedResturantItemImage extends StatelessWidget {
  const BookedResturantItemImage({
    super.key,
    required this.widget,
  });

  final BookedResturantItem widget;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
    );
  }
}
