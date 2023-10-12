import 'package:flutter/material.dart';
import 'package:flutter_common_extensions/flutter_common_extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tech_store/Feature/auth/view/screen/login_screen.dart';
import 'package:tech_store/Feature/auth/view/screen/register_screen.dart';
import 'package:tech_store/Feature/auth/view/widget/onboarding_widget/text_page_view.dart';

import '../../../../core/utils/constants/static.dart';
import '../widget/onboarding_widget/custom_onboarding_button.dart';
import '../widget/onboarding_widget/image_page_view.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController pageController1 = PageController();
  final PageController pageController2 = PageController();
  int currentIndex = 0;

  Future<void> setOnboarding() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool('finishedOnBoarding', true);
  }

  void goToNextPage() {
    if (currentIndex < Static.onboardingTitle.length - 1) {
      currentIndex++;
      pageController1.animateToPage(currentIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.decelerate);
      pageController2.animateToPage(currentIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.decelerate);
    } else {
      setOnboarding();
      context.push(const RegisterScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ImagePageView(controller: pageController1),
          TextPageView(
              controller: pageController2,
              onPageChanged: (value) => setState(() {
                    currentIndex = value;
                    pageController1.animateToPage(value,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.decelerate);
                  })),
          CustomOnBoardingButton(
            index: currentIndex,
            onPressed: () => setState(() => goToNextPage()),
          )
        ],
      ),
    );
  }
}
