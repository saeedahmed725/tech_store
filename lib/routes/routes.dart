import 'package:flutter/material.dart';

import '../core/errors/exceptions.dart';

class RouteGenerator {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String auth = '/auth';


  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
      //return MaterialPageRoute(builder: (_) => const SplashScreen());
      default:
        throw RouteException('Route not found');
    }
  }
}
