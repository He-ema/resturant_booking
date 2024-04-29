import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobizz/core/utils/assets.dart';
import 'package:jobizz/features/home/presentation/views/widgets/location_widget.dart';
import 'package:jobizz/features/home/presentation/views/widgets/header_text_field.dart';

import '../../../../../constants.dart';

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
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: const ShapeDecoration(
                    shape: OvalBorder(),
                  ),
                  child: CachedNetworkImage(
                    placeholder: (context, url) =>
                        const SpinKitSpinningLines(color: kPrimaryColor),
                    imageUrl: FirebaseAuth.instance.currentUser!.photoURL!,
                    fit: BoxFit.cover,
                  ),
                ),
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
