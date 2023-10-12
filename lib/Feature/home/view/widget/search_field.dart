import 'package:flutter/material.dart';
import 'package:flutter_common_extensions/flutter_common_extensions.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/constants/app_color.dart';
import '../../../../core/utils/constants/app_fonts.dart';
import '../../../../core/utils/constants/app_image_assets.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: context.width - 110,
          child: TextField(
            onTapOutside: (event) {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
            },
            decoration: InputDecoration(
              hintText: 'بحث',
              hintStyle: TextStyle(
                  fontFamily: AppFonts.almaraiFont,
                  fontSize: 14,
                  color: Colors.grey),
              fillColor: AppColor.kPrimaryColor,
              prefixIconConstraints: BoxConstraints.loose(const Size(50, 50)),
              prefixIcon: Padding(
                padding: const EdgeInsetsDirectional.only(start: 18.0, end: 7),
                child: SvgPicture.asset(AppImageAssets.search,
                    color: Colors.black),
              ),
              contentPadding: const EdgeInsets.all(14),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: AppColor.kPrimaryColor),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              AppImageAssets.filter,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
