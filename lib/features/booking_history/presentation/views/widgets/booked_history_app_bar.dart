import 'package:flutter/material.dart';
import 'package:jobizz/core/utils/app_styles.dart';

import '../../../../../constants.dart';

class BookedHistoryAppBar extends StatelessWidget {
  const BookedHistoryAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      title: Text(
        'Booking History',
        style: AppStyles.styleSemiBold16.copyWith(color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: kPrimaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
    );
  }
}
