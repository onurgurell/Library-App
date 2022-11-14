import 'package:flutter/material.dart';

enum AppTheme {
  // ignore: constant_identifier_names
  AppDarkTheme,
  // ignore: constant_identifier_names
  AppLightTheme,
}

final appThemeData = {
  AppTheme.AppDarkTheme: ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xff1b262c),
  ),
  AppTheme.AppLightTheme: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue.shade400,
  ),
};
