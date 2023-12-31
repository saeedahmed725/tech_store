part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class GetCurrentThemeEvent extends ThemeEvent {
  @override
  List<Object?> get props => [];
}


class ThemeChangeEvent extends ThemeEvent {
  final AppTheme theme;

  const ThemeChangeEvent({required this.theme});

  @override
  List<Object?> get props => [theme];
}