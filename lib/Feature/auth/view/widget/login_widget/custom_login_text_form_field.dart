import 'package:flutter/material.dart';
import 'package:flutter_common_extensions/flutter_common_extensions.dart';

import '../../../../../core/utils/shared/widget/custom_text.dart';
import '../../../../../core/utils/shared/widget/custom_text_fields.dart';

class CustomLoginFormFiled extends StatefulWidget {
  const CustomLoginFormFiled({
    super.key,
  });

  @override
  State<CustomLoginFormFiled> createState() => _CustomFormLoginFiledState();
}

class _CustomFormLoginFiledState extends State<CustomLoginFormFiled> {
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const CustomText(
              text: 'بريد إلكتروني',
              textAlign: TextAlign.right,
              color: Colors.grey,
              fontSize: 14),
          15.height,
          const CustomTextFiled(
            hintText: 'أدخل عنوان بريدك الإلكتروني',
            keyboardType: TextInputType.emailAddress,
          ),
          20.height,
          const CustomText(
              text: 'كلمة المرور',
              textAlign: TextAlign.right,
              color: Colors.grey,
              fontSize: 14),
          15.height,
          CustomTextFiled(
              hintText: 'أدخل كلمة مرور بريدك الإلكتروني',
              obscureText: visible,
              keyboardType: TextInputType.visiblePassword,
              suffixIcon: IconButton(
                  onPressed: () => setState(() => visible = !visible),
                  icon: Icon(visible
                      ? Icons.visibility_off_rounded
                      : Icons.visibility_rounded))),
        ],
      ),
    );
  }
}
