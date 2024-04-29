import 'package:flutter/material.dart';
import 'package:jobizz/core/utils/app_styles.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
    required this.title,
    required this.icon,
  });
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.black,
        // size: 40,
      ),
      title: Text(
        title,
        style: AppStyles.styleRegular18,
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
