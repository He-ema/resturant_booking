import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobizz/constants.dart';
import 'package:jobizz/core/utils/app_styles.dart';
import 'package:jobizz/core/utils/assets.dart';

class HeaderTextField extends StatelessWidget {
  const HeaderTextField({
    super.key,
    required this.hint,
    this.controller,
  });
  final String hint;
  final TextEditingController? controller;

  @override
  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      controller: controller,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        prefixIconConstraints: BoxConstraints.loose(
          const Size.square(56),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SvgPicture.asset(Assets.imagesSearch),
        ),
        filled: true,
        fillColor: const Color(0xffE6E7E9),
        hintText: hint,
        hintStyle: AppStyles.styleRegular12,
        border: createBorder(),
        enabledBorder: createBorder(),
        focusedBorder: createBorder(),
      ),
    );
  }

  OutlineInputBorder createBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Color(0xffE6E7E9),
      ),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
