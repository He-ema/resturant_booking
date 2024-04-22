import 'package:flutter/material.dart';

class NearbyResturantItem extends StatelessWidget {
  const NearbyResturantItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 340 / 88,
      child: Container(
        width: 200,
        height: 200,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: Colors.white,
        ),
      ),
    );
  }
}
