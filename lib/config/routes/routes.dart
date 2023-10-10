import 'package:flutter/material.dart';
import 'package:tech_store/Feature/auth/view/screen/launcher_screen.dart';

import '../../core/errors/exceptions.dart';

class RouteGenerator {
  static const String launcher = '/';
  static const String onboarding = '/onboarding';
  static const String auth = '/auth';


  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case launcher:
      return MaterialPageRoute(builder: (_) => const LauncherScreen());
      default:
        throw RouteException('Route not found');
    }
  }
}
