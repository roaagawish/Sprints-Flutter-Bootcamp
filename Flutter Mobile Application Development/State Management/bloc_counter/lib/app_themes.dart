import 'package:flutter/material.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor:  Colors.amber,
    primarySwatch: Colors.amber,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.amber,
      foregroundColor: Colors.black,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.amber,
        foregroundColor: Colors.white,
      ),
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(color: Colors.black),
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
     primaryColor:  Colors.amber[300],
    primarySwatch: Colors.amber,
    appBarTheme:  AppBarTheme(
      backgroundColor: Colors.amber[300],
      foregroundColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.amber[300],
        foregroundColor: Colors.white,
      ),
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(color: Colors.white),
    ),
  );
}
