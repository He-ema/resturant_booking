import 'package:flutter/material.dart';
import 'package:jobizz/constants.dart';
import 'package:jobizz/core/utils/app_styles.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.location_on,
          color: kPrimaryColor,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          'Agrabad 435, Chittagong',
          style: AppStyles.styleMedium12,
        ),
      ],
    );
  }
}
