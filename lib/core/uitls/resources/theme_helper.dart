import 'dart:ui';

import 'package:flutter/scheduler.dart';

class ThemeHelper {
  Future<bool> getCurrentTheme() async {
    Brightness brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    switch (brightness) {
      case Brightness.dark:
        return true;
      case Brightness.light:
        return false;
    }
  }
}
