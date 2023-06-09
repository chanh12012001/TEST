import 'package:flutter/material.dart';

class TextFieldBase extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Function(String)? onChanged;
  final TextStyle? fontStyle;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final bool? filled;
  final bool readOnly;
  final Function()? onTap;

  const TextFieldBase({
    super.key,
    this.controller,
    this.hintText,
    this.onChanged,
    this.fontStyle,
    this.prefixIcon,
    this.keyboardType,
    this.suffixIcon,
    this.filled,
    this.onTap,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          onTap: onTap,
          readOnly: readOnly,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
          keyboardType: keyboardType,
          controller: controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            filled: true,
            border: InputBorder.none,
            fillColor: const Color(0xffF8F8F8),
            prefixIcon: prefixIcon,
            hintText: hintText,
            hintStyle: const TextStyle(
                color: Color(0xff999999),
                fontSize: 16,
                fontWeight: FontWeight.w300),
            suffixIcon: suffixIcon,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 22, horizontal: 15),
          ),
          onChanged: onChanged,
        )
      ],
    );
  }
}
