import 'package:bloc_counter/app_themes.dart';
import 'package:bloc_counter/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_counter/bloc/theme_bloc/theme_bloc.dart';
import 'package:bloc_counter/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => CounterBloc()),
      BlocProvider(create: (context) => ThemeBloc()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'BLoc Counter',
          theme:  AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: state.themeMode,
          home: HomeScreen(),
        );
      },
    );
  }
}
