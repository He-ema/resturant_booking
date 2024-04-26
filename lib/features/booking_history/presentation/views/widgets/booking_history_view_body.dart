import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobizz/core/utils/app_styles.dart';
import 'package:jobizz/features/booking_history/presentation/managers/cubit/booked_resturant_cubit.dart';
import 'package:jobizz/features/booking_history/presentation/views/widgets/booked_history_success_body.dart';

import '../../../../../constants.dart';

class BookingHistoryViewBody extends StatefulWidget {
  const BookingHistoryViewBody({super.key});

  @override
  State<BookingHistoryViewBody> createState() => _BookingHistoryViewBodyState();
}

class _BookingHistoryViewBodyState extends State<BookingHistoryViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<BookedResturantCubit>(context).getBookedResturants();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookedResturantCubit, BookedResturantState>(
      builder: (context, state) {
        if (state is BookedResturantSuccess) {
          return BookedHistorySuccessBody(
            state: state,
          );
        } else if (state is BookedResturantFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
