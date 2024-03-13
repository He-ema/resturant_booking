import 'package:flutter/material.dart';
import 'package:jobizz/features/booking_history/presentation/views/widgets/booking_history_view_body.dart';

class BookingHistoryView extends StatelessWidget {
  const BookingHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BookingHistoryViewBody(),
    );
  }
}
