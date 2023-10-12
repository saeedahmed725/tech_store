import 'package:flutter/material.dart';

import '../../../../../core/utils/shared/widget/custom_text.dart';

class ResetPasswordWidget extends StatelessWidget {
  const ResetPasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
      child: Row(
        children: [
          TextButton(
            onPressed: () {},
            style: const ButtonStyle(
                overlayColor: MaterialStatePropertyAll(Color(0xFF2e2e2e))),
            child: const CustomText(
                text: 'نسيت كلمة المرور',
                textAlign: TextAlign.right,
                color: Colors.grey,
                fontSize: 14),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {},
            style: const ButtonStyle(
                overlayColor: MaterialStatePropertyAll(Color(0xFF2e2e2e))),
            child: const CustomText(
                text: 'أنشاء حساب؟',
                textAlign: TextAlign.right,
                color: Colors.grey,
                fontSize: 14),
          )
        ],
      ),
    );
  }
}
