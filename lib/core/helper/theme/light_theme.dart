import 'package:flutter/material.dart';

class LightTheme {
  static const Color lightPrimary = Colors.white;
  static const Color lightAccent = Colors.black;
  static const Color lightBG = Colors.white;

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    scaffoldBackgroundColor: lightBG,
    cardColor: lightAccent,
    appBarTheme: const AppBarTheme(
      elevation: 0,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: lightAccent),
  );
}
