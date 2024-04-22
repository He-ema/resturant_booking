import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobizz/core/utils/assets.dart';
import 'package:jobizz/features/home/presentation/views/widgets/location_widget.dart';
import 'package:jobizz/features/home/presentation/views/widgets/header_text_field.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          // const SizedBox(
          //   height: 35,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(Assets.imagesMenu),
              const LocationWidget(),
              Container(
                width: 32,
                height: 32,
                decoration: const ShapeDecoration(
                  shape: OvalBorder(),
                ),
                child: Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/food-5f010.appspot.com/o/avatar.png?alt=media&token=76a28738-9cfb-44e2-8113-dd4549002466'),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: HeaderTextField(
              hint: 'Search',
            ),
          ),
        ],
      ),
    );
  }
}
