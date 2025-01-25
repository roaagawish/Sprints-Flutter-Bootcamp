import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial(themeMode: ThemeMode.light)) {
    on<ToggleTheme>((event, emit) {
      emit(ThemeInitial(
          themeMode: state.themeMode == ThemeMode.light
              ? ThemeMode.dark
              : ThemeMode.light));
    });
  }
}
