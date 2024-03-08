import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobizz/constants.dart';
import 'package:jobizz/core/utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.image,
      required this.text,
      this.color,
      this.textColor,
      this.onPressed,
      this.isLoading = false,
      this.circularProgressIndicatorColor});
  final String? image;
  final Color? circularProgressIndicatorColor;
  final String text;
  final Color? color;
  final bool isLoading;
  final Color? textColor;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      color: color ?? kPrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      onPressed: onPressed,
      child: isLoading
          ? Center(
              child: CircularProgressIndicator(
                  color: circularProgressIndicatorColor ?? Colors.white),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                image == null
                    ? const SizedBox()
                    : Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: SvgPicture.asset(image!),
                      ),
                Text(
                  text,
                  style: AppStyles.styleBold14
                      .copyWith(color: textColor ?? Colors.white),
                ),
              ],
            ),
    );
  }
}
