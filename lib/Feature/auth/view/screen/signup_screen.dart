import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_common_extensions/flutter_common_extensions.dart';

import '../../../../core/bloc/theme/theme_bloc.dart';
import '../../../../core/utils/shared/widget/custom_button.dart';
import '../../../../core/utils/shared/widget/custom_text.dart';
import '../widget/sign_up_widget/customs_ign_up_form_filed.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_rounded, size: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            20.height,
            BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                if (state is LoadedThemeState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomText(
                          text: 'أهلا بك في',
                          color: state.themeValue ? Colors.white : Colors.black,
                          textAlign: TextAlign.right,
                          fontSize: 28),
                      CustomText(
                          text: 'تيك أستور',
                          color: state.themeValue ? Colors.white : Colors.black,
                          textAlign: TextAlign.right,
                          fontSize: 20),
                    ],
                  );
                } else {
                  return Container();
                }
              },
            ),
            20.height,
            const CustomText(
                text: 'أهلاً بك قم بالأنضمام إلينا الآن',
                textAlign: TextAlign.right,
                color: Colors.grey,
                fontSize: 14),
            const Spacer(),
            const CustomSignUpFormFiled(),
            20.height,
            const Spacer(),
            const CustomButton(
              text: 'أنشاء حساب',
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
