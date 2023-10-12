import 'package:flutter/material.dart';
import 'package:flutter_common_extensions/flutter_common_extensions.dart';

import '../../../../core/utils/constants/static.dart';
import '../../../../core/utils/shared/widget/custom_text.dart';

class HomeTabBar extends StatelessWidget {
  const HomeTabBar({super.key, required this.selectedIndex, this.onTap});

  final int selectedIndex;
  final Function(int index)? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: context.width - 48,
      child: ListView.builder(
        itemCount: Static.homeCategory.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => onTap!(index),
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              child: selectedIndex == index
                  ? CustomText(text: Static.homeCategory[index], fontSize: 16)
                  : CustomText(
                      text: Static.homeCategory[index],
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                      fontSize: 16),
            ),
          );
        },
      ),
    );
  }
}
