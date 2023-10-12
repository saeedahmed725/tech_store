import 'package:flutter/material.dart';
import 'package:flutter_common_extensions/flutter_common_extensions.dart';

import '../../../../core/utils/constants/app_image_assets.dart';
import '../../../../core/utils/shared/widget/custom_text.dart';

class WhiteFridayCard extends StatelessWidget {
  const WhiteFridayCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        Container(
          height: 105,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: const LinearGradient(
                colors: [Colors.black, Colors.black45],
              )),
        ),
        Row(
          children: [
            Image.asset(AppImageAssets.whiteFriday),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  text: 'الجمعة البيضاء',
                  fontSize: 22,
                  color: Colors.white,
                ),
                3.height,
                const CustomText(
                  text: 'خصومات حتي 30 %',
                  fontSize: 12,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
