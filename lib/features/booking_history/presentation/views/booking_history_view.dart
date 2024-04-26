import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobizz/constants.dart';
import 'package:jobizz/core/utils/app_styles.dart';
import 'package:jobizz/features/booking_history/presentation/managers/cubit/booked_resturant_cubit.dart';
import 'package:jobizz/features/booking_history/presentation/views/widgets/booking_history_view_body.dart';

class BookingHistoryView extends StatelessWidget {
  const BookingHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => BookedResturantCubit(),
        child: const BookingHistoryViewBody(),
      ),
    );
  }
}
