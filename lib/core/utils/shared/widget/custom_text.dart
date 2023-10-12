import 'package:flutter/material.dart';

import '../../constants/app_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    required this.fontSize,
    this.color = Colors.black,
    this.fontWeight = FontWeight.w700,
    this.textAlign = TextAlign.center,
    this.decoration,
  });

  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          decoration: decoration,
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
          fontFamily: AppFonts.almaraiFont),
    );
  }
}
