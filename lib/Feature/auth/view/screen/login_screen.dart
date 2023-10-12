import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_common_extensions/flutter_common_extensions.dart';
import 'package:tech_store/Feature/home/view/screens/home_screens.dart';
import 'package:tech_store/core/utils/shared/widget/custom_button.dart';
import 'package:tech_store/core/utils/shared/widget/custom_text.dart';

import '../../../../core/bloc/theme/theme_bloc.dart';
import '../widget/login_widget/custom_login_text_form_field.dart';
import '../widget/login_widget/reset_password_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                text: 'أهلاً بعودتك قم بتسجيل الدخول الآن',
                textAlign: TextAlign.right,
                color: Colors.grey,
                fontSize: 14),
            const Spacer(),
            const CustomLoginFormFiled(),
            20.height,
            const Spacer(),
            CustomButton(
              text: 'تسجيل الدخول',
              onTap: () => context.push(const HomeScreen()),
            ),
            const Spacer(),
            const ResetPasswordWidget(),
          ],
        ),
      ),
    );
  }
}
