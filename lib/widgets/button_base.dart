import 'package:flutter/material.dart';

class ButtonBase extends StatelessWidget {
  const ButtonBase(
      {super.key,
      this.backgroundColor,
      this.borderWidth,
      this.borderColor,
      this.padding,
      this.onPressed,
      required this.text,
      required this.textStyle});
  final Color? backgroundColor;
  final double? borderWidth;
  final Color? borderColor;
  final EdgeInsetsGeometry? padding;
  final Function()? onPressed;
  final String text;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: borderColor == null
                ? BorderSide.none
                : BorderSide(
                    color: borderColor ?? const Color(0xffE80881),
                    width: borderWidth ?? 1,
                  ),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        padding: MaterialStateProperty.all(padding ?? const EdgeInsets.all(18)),
      ),
      child: SizedBox(
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
