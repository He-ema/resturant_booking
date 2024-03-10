import 'package:flutter/material.dart';
import 'package:jobizz/constants.dart';
import 'package:jobizz/core/utils/app_styles.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hint,
    this.controller,
    this.isPassword,
  });
  final String hint;
  final TextEditingController? controller;
  final bool? isPassword;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: (isHidden && (widget.isPassword ?? false)),
      controller: widget.controller,
      validator: (value) {
        if (value!.isEmpty ?? true) {
          return 'This field can\'t be empty';
        } else {
          return null;
        }
      },
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword != null
            ? IconButton(
                onPressed: () {
                  isHidden = !isHidden;
                  setState(() {});
                },
                icon: isHidden
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
              )
            : null,
        hintText: widget.hint,
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
        color: Color(0xffBEC5D1),
      ),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
