import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/theme/theme_bloc.dart';
import '../../constants/app_fonts.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.validator,
    this.controller,
    this.suffixIcon,
    this.keyboardType,
  });

  final String hintText;
  final bool obscureText;
  final String? Function(String? value)? validator;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        if (state is LoadedThemeState) {
          return TextFormField(
            controller: controller,
            validator: validator,
            autocorrect: true,
            obscureText: obscureText,
            onTapOutside: (event) {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
            },
            keyboardType: keyboardType,
            decoration: InputDecoration(
                filled: true,
                hintText: hintText,
                hintStyle: TextStyle(
                    fontFamily: AppFonts.almaraiFont,
                    fontSize: 14,
                    color: Colors.grey),
                fillColor: state.themeValue? const Color(0xFF434343)  : const Color(0xFFF8F8F8) ,
                suffixIcon: suffixIcon,
                contentPadding: const EdgeInsets.all(13),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(14))),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
