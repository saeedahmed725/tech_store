import 'package:flutter/material.dart';
import 'package:flutter_common_extensions/flutter_common_extensions.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
  });

  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        width: context.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(14)),
        child: CustomText(text: text, fontSize: 18, color: Colors.white),
      ),
    );
  }
}
