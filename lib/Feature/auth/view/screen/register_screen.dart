import 'package:flutter/material.dart';
import 'package:tech_store/core/utils/constants/app_image_assets.dart';

import '../widget/register_widget/register_component.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(AppImageAssets.register, fit: BoxFit.cover),
        const RegisterComponent()
      ]),
    );
  }
}
