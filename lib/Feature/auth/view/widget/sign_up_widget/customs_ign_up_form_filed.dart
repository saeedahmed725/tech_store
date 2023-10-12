import 'package:flutter/material.dart';
import 'package:flutter_common_extensions/flutter_common_extensions.dart';

import '../../../../../core/utils/shared/widget/custom_text.dart';
import '../../../../../core/utils/shared/widget/custom_text_fields.dart';

class CustomSignUpFormFiled extends StatefulWidget {
  const CustomSignUpFormFiled({
    super.key,
  });

  @override
  State<CustomSignUpFormFiled> createState() => _CustomSignUpFormFiledState();
}

class _CustomSignUpFormFiledState extends State<CustomSignUpFormFiled> {
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const CustomText(
              text: 'اسم المستخدم',
              textAlign: TextAlign.right,
              color: Colors.grey,
              fontSize: 14),
          15.height,
          const CustomTextFiled(
            hintText: 'أدخل أسمك',
            keyboardType: TextInputType.emailAddress,
          ),
          20.height,
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
