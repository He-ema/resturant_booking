import 'package:flutter/material.dart';
import 'package:jobizz/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xfff6f6f6),
      body: HomeViewBody(),
    );
  }
}
