import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_common_extensions/flutter_common_extensions.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/bloc/theme/theme_bloc.dart';
import '../../../../../core/utils/constants/app_image_assets.dart';
import '../../../../../core/utils/constants/static.dart';
import '../../../../../core/utils/shared/widget/custom_text.dart';

class TextPageView extends StatelessWidget {
  const TextPageView({super.key, this.controller, this.onPageChanged});

  final PageController? controller;
  final Function(int value)? onPageChanged;

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
                  horizontal: 14, vertical: 25),
              decoration: BoxDecoration(
                color:
                    state.themeValue ? const Color(0xFF2e2e2e) : Colors.white,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(24),
                    topLeft: Radius.circular(24)),
              ),
              child: PageView.builder(
                  controller: controller,
                  itemCount: Static.onboardingTitle.length,
                  onPageChanged: onPageChanged,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppImageAssets.logo,
                          color: state.themeValue ? Colors.white : Colors.black,
                        ),
                        30.height,
                        CustomText(
                          text: Static.onboardingTitle[index],
                          color: state.themeValue ? Colors.white : Colors.black,
                          fontSize: 24,
                        ),
                        12.height,
                        CustomText(
                          text: Static.onboardingSubTitle[index],
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    );
                  }),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
