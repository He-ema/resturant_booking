import 'package:flutter/material.dart';
import 'package:jobizz/features/profile/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xfff6f6f6),
      body: ProfileViewBody(),
    );
  }
}
