import 'dart:ui';

import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeHelper {
  Future<bool> getCurrentTheme() async {
    Brightness brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
    switch (brightness) {
      case Brightness.dark:
        return true;
      case Brightness.light:
        return false;
    }
  }
}