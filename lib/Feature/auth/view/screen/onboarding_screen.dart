import 'package:flutter/material.dart';
import 'package:flutter_common_extensions/flutter_common_extensions.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:tech_store/core/uitls/constants/app_fonts.dart';
import 'package:tech_store/core/uitls/constants/app_image_assets.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController pageController1 = PageController();
  final PageController pageController2 = PageController();
  int currentIndex = 0;

  void goToNextPage() {
    if (currentIndex < onboardingTitle.length) {
      currentIndex++;
      pageController1.animateToPage(currentIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.decelerate);
      pageController2.animateToPage(currentIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.decelerate);
    } else {
      //to LoginScreen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
              controller: pageController1,
              itemCount: onboardingImage.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(onboardingImage[index]));
              }),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: context.height * 0.5,
                  width: context.width,
                  padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 14, vertical: 25),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(24),
                        topLeft: Radius.circular(24)),
                  ),
                  child: PageView.builder(
                      controller: pageController2,
                      itemCount: onboardingTitle.length,
                      onPageChanged: (value) {
                        setState(() {
                          currentIndex = value;
                          pageController1.animateToPage(value,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.decelerate);
                        });
                      },
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppImageAssets.logo,
                            ),
                            30.height,
                            CustomText(
                              text: onboardingTitle[index],
                              fontSize: 24,
                            ),
                            12.height,
                            CustomText(
                              text: onboardingSubTitle[index],
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        );
                      }),
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: context.width,
              height: context.height * 0.22,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ...List.generate(
                          onboardingTitle.length,
                          (index) => AnimatedContainer(
                              height: 8,
                              width: currentIndex == index ? 50 : 8,
                              margin: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(50)),
                              duration: const Duration(milliseconds: 300))),
                    ],
                  ),
                  10.height,
                  IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () => setState(() => goToNextPage()),
                    icon: CircularPercentIndicator(
                      radius: 47.0,
                      lineWidth: 3.0,
                      percent: ((currentIndex + 1) / onboardingTitle.length),
                      center: const CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.black,
                        child:
                            Icon(Icons.arrow_forward_ios, color: Colors.white),
                      ),
                      progressColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

List<String> onboardingTitle = [
  'تسوق اون لاين',
  'عروض و خصومات',
  'الدفع الآمن'
];
List<String> onboardingSubTitle = [
  'هذا النص هو مثال لنص يمكن أن يستبدل في نفس\n المساحة، لقد تم توليد هذا النص من مولد النص العربى، ',
  'هذا النص هو مثال لنص يمكن أن يستبدل في نفس\n المساحة، لقد تم توليد هذا النص من مولد النص العربى، ',
  'هذا النص هو مثال لنص يمكن أن يستبدل في نفس\n المساحة، لقد تم توليد هذا النص من مولد النص العربى، '
];
List<String> onboardingImage = [
  AppImageAssets.onboardingPage1,
  AppImageAssets.onboardingPage2,
  AppImageAssets.onboardingPage3
];

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    required this.fontSize,
    this.color = Colors.black,
    this.fontWeight = FontWeight.w700,
  });

  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
          fontFamily: AppFonts.almaraiFont),
    );
  }
}
