import 'package:flutter/material.dart';
import 'package:jobizz/core/utils/app_styles.dart';
import 'package:jobizz/features/booking_history/presentation/managers/cubit/booked_resturant_cubit.dart';
import 'package:jobizz/features/booking_history/presentation/views/widgets/booked_history_app_bar.dart';
import 'package:jobizz/features/booking_history/presentation/views/widgets/booked_items_list.dart';
import 'package:jobizz/features/booking_history/presentation/views/widgets/booked_resturant_item.dart';

import '../../../../../constants.dart';

class BookedHistorySuccessBody extends StatelessWidget {
  const BookedHistorySuccessBody({
    super.key,
    required this.state,
  });
  final BookedResturantSuccess state;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      const BookedHistoryAppBar(),
      BookedItemsList(state: state),
    ]);
  }
}
