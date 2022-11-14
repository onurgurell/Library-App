import 'package:flutter/material.dart';

class DarkTheme {
  static const Color darkPrimary = Colors.black;
  static const Color darkAccent = Colors.white;
  static const Color darkBG = Colors.black;

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    scaffoldBackgroundColor: darkBG,
    cardColor: darkAccent,
    appBarTheme: const AppBarTheme(
      elevation: 0,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: darkAccent),
  );
}
