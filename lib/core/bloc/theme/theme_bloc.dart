import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../config/theme/app_theme.dart';
import '../../uitls/resources/theme_helper.dart';
part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  int currentIndex = 0;

  ThemeBloc() : super(ThemeInitial()) {
    on<ThemeEvent>((event, emit) async {
      if (event is GetCurrentThemeEvent) {
        debugPrint("GetCurrentThemeEvent");
        final bool themeValue = await ThemeHelper().getCurrentTheme();
        final theme = AppTheme.values.firstWhere((appTheme) => appTheme.value == themeValue);
        emit(LoadedThemeState(
            themeData: appThemeData[theme],
            themeValue: themeValue));
      }
    });
  }
}