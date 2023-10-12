import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_common_extensions/flutter_common_extensions.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/bloc/theme/theme_bloc.dart';
import '../../../../../core/utils/constants/app_image_assets.dart';
import '../../../../../core/utils/shared/widget/custom_button.dart';
import '../../../../../core/utils/shared/widget/custom_text.dart';
import '../../screen/login_screen.dart';
import '../../screen/signup_screen.dart';

class RegisterComponent extends StatelessWidget {
  const RegisterComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        if (state is LoadedThemeState) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: context.height * 0.5,
              width: context.width,
              padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: 14, vertical: 30),
              decoration: BoxDecoration(
                  color:
                      state.themeValue ? const Color(0xFF2e2e2e) : Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24))),
              child: Column(
                children: [
                  SvgPicture.asset(
                    AppImageAssets.logo,
                    color: state.themeValue ? Colors.white : Colors.black,
                  ),
                  30.height,
                  CustomText(
                      text: 'أنضم ألينا الآن',
                      color: state.themeValue ? Colors.white : Colors.black,
                      fontSize: 24),
                  30.height,
                  CustomButton(
                      text: 'تسجيل الدخول',
                      onTap: () => context.push(const LoginScreen())),
                  20.height,
                  CustomButton(
                      text: 'انشئ حساب',
                      onTap: () => context.push(const SignUpScreen())),
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
