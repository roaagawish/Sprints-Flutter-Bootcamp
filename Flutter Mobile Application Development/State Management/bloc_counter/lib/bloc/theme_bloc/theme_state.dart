part of 'theme_bloc.dart';

@immutable
abstract class ThemeState {
  final ThemeMode themeMode;

  ThemeState({required this.themeMode});
  
}

class ThemeInitial extends ThemeState {
  ThemeInitial({required super.themeMode });
  
}
