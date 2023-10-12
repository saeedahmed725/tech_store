import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/static.dart';

class ImagePageView extends StatelessWidget {
  const ImagePageView({super.key, this.controller});

  final PageController? controller;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller,
        itemCount: Static.onboardingImage.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Align(
              alignment: Alignment.topCenter,
              child: Image.asset(Static.onboardingImage[index]));
        });
  }
}
