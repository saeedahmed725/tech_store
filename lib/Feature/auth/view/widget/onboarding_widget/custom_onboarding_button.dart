import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_common_extensions/flutter_common_extensions.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:tech_store/core/bloc/theme/theme_bloc.dart';

import '../../../../../core/utils/constants/static.dart';

class CustomOnBoardingButton extends StatelessWidget {
  const CustomOnBoardingButton(
      {super.key, required this.index, this.onPressed});

  final int index;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
      if (state is LoadedThemeState) {
        return Align(
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
                      Static.onboardingTitle.length,
                      (i) => AnimatedContainer(
                        height: 8,
                        width: index == i ? 50 : 8,
                        margin: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color:
                                state.themeValue ? Colors.white : Colors.black,
                            borderRadius: BorderRadius.circular(50)),
                        duration: const Duration(milliseconds: 300),
                      ),
                    ),
                  ],
                ),
                10.height,
                IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: onPressed,
                  icon: CircularPercentIndicator(
                    radius: 47.0,
                    lineWidth: 3.0,
                    progressColor: state.themeValue ? Colors.white : Colors.black,
                    percent: (index + 1) / Static.onboardingTitle.length,
                    center: CircleAvatar(
                      radius: 35,
                      backgroundColor:
                          state.themeValue ? Colors.white : Colors.black,
                      child: Icon(Icons.arrow_forward_ios,
                          color: state.themeValue ? Colors.black : Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        return Container();
      }
    });
  }
}
