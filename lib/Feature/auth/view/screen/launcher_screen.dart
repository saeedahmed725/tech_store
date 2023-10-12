import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_store/Feature/auth/view/screen/onboarding_screen.dart';
import 'package:tech_store/Feature/auth/view/screen/register_screen.dart';
import 'package:tech_store/core/utils/constants/extension.dart';

import '../../../../core/bloc/authentication/authentication_bloc.dart';

class LauncherScreen extends StatefulWidget {
  const LauncherScreen({Key? key}) : super(key: key);

  @override
  State<LauncherScreen> createState() => _LauncherScreenState();
}

class _LauncherScreenState extends State<LauncherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          switch (state.authState) {
            case AuthState.firstRun:
              //Onboarding
              debugPrint('OnBoardingScreen Route');
              context.pushReplacement(const OnBoardingScreen());
              break;
            case AuthState.authenticated:
              debugPrint('Home Screen Route');
              //Home Screen
              break;
            case AuthState.unauthenticated:
              //login screen Or sign up
              debugPrint('Register Route');
              context.pushReplacement(const RegisterScreen());
              break;
          }
        },
        child: Container(color: Colors.white),
      ),
    );
  }
}
