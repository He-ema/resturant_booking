import 'package:flutter/material.dart';
import 'package:jobizz/features/bottom_nav_bar/presentation/views/widgets/bottom_nav_bar_view_body.dart';

class BottomNavBarView extends StatelessWidget {
  const BottomNavBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BottomNavBarViewBody(),
    );
  }
}
