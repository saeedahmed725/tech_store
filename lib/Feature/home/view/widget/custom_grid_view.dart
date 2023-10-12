import 'package:flutter/material.dart';

import '../../../../core/utils/constants/app_color.dart';
import '../../../../core/utils/constants/app_image_assets.dart';
import '../../../../core/utils/shared/widget/custom_text.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.65, crossAxisCount: 2),
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsetsDirectional.all(3),
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColor.kPrimaryColor,
                borderRadius: BorderRadius.circular(18)),
            child: Stack(alignment: Alignment.bottomCenter, children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {},
                      color: Colors.red,
                      icon: const Icon(Icons.favorite)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(AppImageAssets.homeItem),
                  )
                ],
              ),
              Container(
                height: 95,
                width: double.infinity,
                padding: const EdgeInsetsDirectional.all(6),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      text:
                      'Lenovo IdeaPad Gaming 3 15.6" 120Hz Gaming Laptop AMD',
                      textAlign: TextAlign.left,
                      fontSize: 9,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          AppImageAssets.companyItem,
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsetsDirectional.all(6),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey.shade200),
                          child: const CustomText(
                              text: "خصم 20%", fontSize: 12),
                        )
                      ],
                    ),
                    const Row(
                      children: [
                        CustomText(text: '222 دينار', fontSize: 14),
                        Spacer(),
                        CustomText(
                            text: '599 دينار',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey),
                      ],
                    )
                  ],
                ),
              )
            ]),
          );
        },
      ),
    );
  }
}
